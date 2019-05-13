/*
 * Copyright 2014-2019 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package jetbrains.mps.logic.reactor.core.internal

import jetbrains.mps.logic.reactor.core.*
import jetbrains.mps.logic.reactor.core.internal.FeedbackStatus.*
import jetbrains.mps.logic.reactor.evaluation.*
import jetbrains.mps.logic.reactor.logical.Logical
import jetbrains.mps.logic.reactor.logical.LogicalContext
import jetbrains.mps.logic.reactor.logical.MetaLogical
import jetbrains.mps.logic.reactor.program.Constraint
import jetbrains.mps.logic.reactor.program.Predicate
import jetbrains.mps.logic.reactor.util.Profiler
import jetbrains.mps.logic.reactor.util.profile
import com.github.andrewoma.dexx.collection.Map as PersMap

internal class ControllerImpl (
    val supervisor: Supervisor,
    val ruleIndex: RuleIndex,
    val trace: EvaluationTrace = EvaluationTrace.NULL,
    val profiler: Profiler? = null) : Controller
{

    private var dispatchFront = Dispatcher(ruleIndex).front()

    // FIXME move to context
    private val frameStack = FrameStack()

    /** For tests only */
    override fun storeView(): StoreView = frameStack.current.store.view()

    /** For tests only */
    override fun evaluate(occ: Occurrence): StoreView {
        // create the internal occurrence
        val active = occ.constraint().occurrence(this, occ.arguments())
        val status = process(active, NORMAL())
        if (status is FAILED) {
            throw status.failure.failureCause()
        }
        return storeView()
    }

    fun activate(constraint: Constraint) : FeedbackStatus {
        // FIXME noLogicalContext
        val context = Context(NORMAL(), noLogicalContext)

        activateConstraint(constraint, context)

        return context.currentStatus()
    }

    override fun currentFrame(): FrameObservable = frameStack.current

    override fun ask(invocation: PredicateInvocation): Boolean {
        val solver = invocation.predicate().symbol().solver()
        val result = solver.ask(invocation)
        trace.ask(result, invocation)
        return result
    }

    override fun tell(invocation: PredicateInvocation) {
        val solver = invocation.predicate().symbol().solver()
        trace.tell(invocation)
        solver.tell(invocation)
    }

    override fun reactivate(occ: Occurrence) {
        // FIXME propagate the status further up the call stack
        // TODO: introduce status to solver API?
        // TODO update the stack

        val status = process(occ, NORMAL())

        if (status is FAILED) {
            throw status.failure.failureCause()
        }
    }

    private fun processMatch(match: RuleMatchEx, inStatus: FeedbackStatus) : FeedbackStatus =
        offerMatch(match, inStatus)
            .let  { when (it) {
                is ABORTED -> { // guard is not satisfied
                    trace.reject(match)
                    return it.recover() // return from the enclosing method

                } is FAILED -> { // guard failed
                    trace.feedback(it.failure)
                    return it.recover() // return from the enclosing method

                } else -> it
            } }
            .also { consumeMatch(match) }
            .also { trace.trigger(match) }
            .also { processDiscarded(match) }
            .then { processBody(match, it) }
            .also { trace.finish(match) }

    override fun offerMatch(match: RuleMatchEx, inStatus: FeedbackStatus) : FeedbackStatus =
        inStatus.then { checkMatchPreconditions(match, it) }
            .also { trace.trying(match) }
            .then { processGuard(match, it) }

    private fun checkMatchPreconditions(match: RuleMatchEx, inStatus: FeedbackStatus) : FeedbackStatus {
        val context = Context(inStatus, match.logicalContext())

        // invoke matched pattern predicates
        for (prd in match.patternPredicates()) {
            // normally these are safe, but unification can fail
            if (!tellPredicate(prd, context)) break
        }

        return context.currentStatus()
    }

    private fun processGuard(match: RuleMatchEx, inStatus: FeedbackStatus) : FeedbackStatus {
        val context = Context(inStatus, match.logicalContext())

        // check guard
        for (gprd in match.rule().guard()) {
            if (!askPredicate(gprd, context)) break
        }

        return context.currentStatus()
    }

    override fun processBody(match: RuleMatchEx, inStatus: FeedbackStatus) : FeedbackStatus {
        val context = Context(inStatus, match.logicalContext())

        val altIt = match.rule().bodyAlternation().iterator()
        while (altIt.hasNext()) {
            val body = altIt.next()

            context.eval { status ->
                if (status is FAILED) {
                    trace.retry(match)
                    status.recover()

                } else {
                    status
                }
            }

            val savedFrame = frameStack.current
            frameStack.push()

            for (item in body) {
                val itemOk = when (item) {
                    is Constraint -> activateConstraint(item, context)
                    is Predicate -> tellPredicate(item, context)
                    else -> throw IllegalArgumentException("unknown item ${item}")
                }

                if (itemOk) {
                    context.withStatus { status ->
                        if (status.feedback?.alreadyHandled() == false) {
                            status.feedback.handle(match.rule(), supervisor)
                        }
                    }

                } else {
                    // status is not operational after constraint/predicate processing
                    break
                }
            }

            val altOk = context.eval { status ->
                if (status is FAILED) {
                    trace.feedback(status.failure)

                    if (altIt.hasNext()) {
                        // clear the failure handled status
                        // the supervisor is NOT notified here
                        status.failure.handle(match.rule())
                        status

                    } else if (status.feedback?.alreadyHandled() == false && status.failure.handle(match.rule(), supervisor)) {
                        status.recover()

                    } else {
                        status
                    }

                } else {
                    status
                }
            }

            if (!altOk) {
                // all constraints activated up to a failure are lost
                frameStack.reset(savedFrame)

            } else {
                // body finished normally
                break
            }
        }

        return context.currentStatus()
    }

    private fun process(active: Occurrence, inStatus: FeedbackStatus) : FeedbackStatus {
        assert(active.alive)

        return profiler.profile<FeedbackStatus>("process_${active.constraint().symbol()}") {

            if (!active.stored) {
                frameStack.current.store.store(active)
                trace.activate(active)
            } else {
                trace.reactivate(active)
            }

            val activatedFront = dispatchFront.expand(active)
            this.dispatchFront = activatedFront

            val outStatus = activatedFront.matches().toList().fold(inStatus) { status, match ->
                // TODO: paranoid check. should be isAlive() instead
                // FIXME: move this check elsewhere
                if (status.operational && active.stored && match.allStored())
                    processMatch(match as RuleMatchImpl, status)
                else
                    status
            }

            // TODO: should be isAlive()
            if (active.stored) {
                trace.suspend(active)
            }

            outStatus
        }
    }

    private fun consumeMatch(match: RuleMatchEx) {
        this.dispatchFront = dispatchFront.consume(match)
    }

    private fun processDiscarded (match: RuleMatchEx) {
        match.forEachReplaced { occ ->
            this.dispatchFront = dispatchFront.contract(occ)

            frameStack.current.store.discard(occ)

            trace.discard(occ)
        }
    }

    private fun activateConstraint(constraint: Constraint, context: Context) : Boolean {
        val args = supervisor.instantiateArguments(constraint.arguments(), context.logicalContext, context)
        return context.eval { status ->

            // TODO update the state stack
            val active = constraint.occurrence(this, args, context.logicalContext)
            process(active, status)

        }
    }

    private fun askPredicate(predicate: Predicate, context: Context) : Boolean =
        profiler.profile<Boolean>("ask_${predicate.symbol()}") {

            context.evalSafe { status ->
                val args = supervisor.instantiateArguments(predicate.arguments(), context.logicalContext, context)
                if (ask(predicate.invocation(args, context.logicalContext, context)))
                    status
                else
                    status.abort(DetailedFeedback("predicate not satisfied"))
            }

        }

    private fun tellPredicate(predicate: Predicate, context: Context) : Boolean =
        profiler.profile<Boolean>("tell_${predicate.symbol()}") {

            context.runSafe {
                val args = supervisor.instantiateArguments(predicate.arguments(), context.logicalContext, context)
                tell(predicate.invocation(args, context.logicalContext, context))
            }

        }

    private val noLogicalContext: LogicalContext = object: LogicalContext {
        override fun <V : Any> variable(metaLogical: MetaLogical<V>): Logical<V>? = null
    }

    private inline fun FeedbackStatus.then(action: (FeedbackStatus) -> FeedbackStatus) : FeedbackStatus =
        if (operational) action(this) else this

    private fun RuleMatch.patternPredicates() =
        (rule().headKept() + rule().headReplaced()).zip(matchHeadKept() + matchHeadReplaced()).flatMap {
            it.first.patternPredicates(it.second.arguments())
        }.toList()

    private fun RuleMatch.allStored() = (matchHeadKept() + matchHeadReplaced()).all { co -> (co as Occurrence).stored }

    private class Context(inStatus: FeedbackStatus,
                          val logicalContext: LogicalContext) : InvocationContext
    {

        private var status = inStatus
        fun currentStatus(): FeedbackStatus = status

        override fun report(feedback: EvaluationFeedback) {
            when (feedback) {
                is EvaluationFailure -> this.status = status.fail(feedback)
                is DetailedFeedback -> this.status = status.report(feedback)
            }
        }

        inline fun withStatus(block: (FeedbackStatus) -> Unit) {
            block.invoke(status)
        }

        inline fun eval(block: (FeedbackStatus) -> FeedbackStatus) : Boolean {
            this.status = block.invoke(status)
            return status.operational
        }

        inline fun evalSafe(block: (FeedbackStatus) -> FeedbackStatus) : Boolean {
            if (status.operational) {
                try {
                    this.status = block.invoke(status)

                } catch (ex: EvaluationFailureException) {
                    this.status = status.fail(EvaluationFailure(ex))
                }
            }
            return status.operational
        }

        inline fun runSafe(block: () -> Unit) : Boolean {
            if (status.operational) {
                try {
                    block()

                } catch (ex: EvaluationFailureException) {
                    this.status = status.fail(EvaluationFailure(ex))
                }
            }

            return status.operational
        }

    }

}

/** Used to create controller from tests */
fun createController(
    supervisor: Supervisor,
    ruleIndex: RuleIndex,
    trace: EvaluationTrace = EvaluationTrace.NULL,
    profiler: Profiler? = null,
    storeView: StoreView? = null) : Controller =
    ControllerImpl(supervisor, ruleIndex, trace, profiler)
