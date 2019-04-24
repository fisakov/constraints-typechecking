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

package jetbrains.mps.logic.reactor.core

import jetbrains.mps.logic.reactor.evaluation.EvaluationSession
import jetbrains.mps.logic.reactor.evaluation.EvaluationTrace
import jetbrains.mps.logic.reactor.evaluation.PredicateInvocation
import jetbrains.mps.logic.reactor.evaluation.SessionSolver
import jetbrains.mps.logic.reactor.program.Program

/**
 * An extension of [EvaluationSession] with ability to access [Controller].
 * @author Fedor Isakov
 */
abstract class EvaluationSessionEx(val program: Program,
                                   val trace: EvaluationTrace,
                                   val sessionSolver: SessionSolver? = null) : EvaluationSession() {

    abstract fun controller(): Controller

    override fun program(): Program = program

    override fun sessionSolver(): SessionSolver = sessionSolver ?: SessionSolver()

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

}