import jetbrains.mps.logic.reactor.core.*
import jetbrains.mps.logic.reactor.core.internal.FeedbackStatus
import jetbrains.mps.logic.reactor.evaluation.PredicateInvocation
import jetbrains.mps.logic.reactor.evaluation.StoreView
import jetbrains.mps.logic.reactor.logical.Logical
import jetbrains.mps.logic.reactor.program.*
import program.MockConstraint
import solver.TestEqPredicate
import java.util.*
import kotlin.collections.HashMap

/**
 * @author Fedor Isakov
 */

class Builder(var rulesLists: List<RulesList>) : RuleLookup {

    val tag2rule = HashMap<String, Rule>()

    val programBuilder = ProgramBuilder(MockConstraintRegistry())

    init {
        rulesLists
            .flatMap { it.rules() }
            .forEach { r -> tag2rule[r.tag()] = r }
    }

    val rules: List<Rule>
        get() = tag2rule.values.toList()

    override fun lookupRuleByTag(tag: String): Rule? = tag2rule[tag]

    fun ruleMatcher(): RuleMatcher = createRuleMatcher(this, rules.first().tag())

    fun program(name: String): Program = programBuilder.program(name, rulesLists)
    
}

private fun createBuilder(rulesListBlocks: Array<out () -> RulesList>): Builder {
    val handlers = ArrayList<RulesList>()
    for (block in rulesListBlocks) {
        handlers.add(block())
    }
    return Builder(handlers)
}

private fun updateBuilder(builder:Builder, rulesListBlocks: Array<out () -> RulesList>): Builder {
    val name2handler = HashMap(builder.rulesLists.map { it.name() to it }.toMap())
    for (block in rulesListBlocks) {
        val h = block()
        name2handler[h.name()] = h
    }
    return Builder(name2handler.values.toList())
}

private fun createHandler(name: String, vararg ruleBlocks: () -> Rule): () -> RulesList = {
    val hb = HandlerBuilder(name)
    for (block in ruleBlocks) {
        hb.appendRule(block())
    }
    hb.toHandler()
}

private fun updateHandler(name: String, rulesList: RulesList, vararg ruleBlocks: () -> Rule): () -> RulesList = {
    val hb = HandlerBuilder(name, rulesList)
    for (block in ruleBlocks) {
        hb.appendRule(block())
    }
    hb.toHandler()
}

// builder DSL for constructing program

fun programWithRules(vararg ruleBuilders: () -> Rule): Builder =
    createBuilder(arrayOf(createHandler("test", * ruleBuilders)))

fun Builder.programWithRules(vararg ruleBuilders: () -> Rule): Builder =
    updateBuilder(this, arrayOf(updateHandler("test",  rulesLists.first(), * ruleBuilders)))

fun rule(tag: String, vararg component: RuleBuilder.() -> Unit): () -> Rule = {
    val rb = RuleBuilder(tag)
    for (cmp in component) {
        rb.cmp()
    }
    rb.toRule()
}

fun headKept(vararg content: ConjBuilder.() -> Unit): RuleBuilder.() -> Unit = {
    appendHeadKept(* buildConjunction(Constraint::class.java, content).toArray())
}

fun headReplaced(vararg content: ConjBuilder.() -> Unit): RuleBuilder.() -> Unit = {
    appendHeadReplaced(* buildConjunction(Constraint::class.java, content).toArray())
}

fun guard(vararg content: ConjBuilder.() -> Unit): RuleBuilder.() -> Unit = {
    appendGuard(* buildConjunction(Predicate::class.java, content).toArray())
}

fun body(vararg content: ConjBuilder.() -> Unit): RuleBuilder.() -> Unit = {
    appendBody(false, * buildConjunction(AndItem::class.java, content).toArray())
}

fun altBody(vararg content: ConjBuilder.() -> Unit): RuleBuilder.() -> Unit = {
    appendBody(true, * buildConjunction(AndItem::class.java, content).toArray())
}

fun constraint(id: String, vararg args: Any): ConjBuilder.() -> Unit = {
    add(createConstraint(args, id))
}


fun equals(left: Any, right: Any): ConjBuilder.() -> Unit = {
    add(TestEqPredicate(left, right))
}

fun occurrence(id: String, vararg args: Any): Occurrence =
    MockConstraint(ConstraintSymbol.symbol(id, args.size)).occurrence(MockController(), listOf(* args))

fun sym0(id: String): ConstraintSymbol =
    ConstraintSymbol(id, 0)

fun sym1(id: String): ConstraintSymbol =
    ConstraintSymbol(id, 1)

fun sym2(id: String): ConstraintSymbol =
    ConstraintSymbol(id, 2)

class MockController : Controller {

    override fun currentFrame(): FrameObservable = object  : FrameObservable {
        override fun storeObserver(): LogicalObserver {
            TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
        }

        override fun addObserver(logical: Logical<*>, obs: (FrameObservable) -> LogicalObserver) {
        }

        override fun removeObserver(logical: Logical<*>, obs: (FrameObservable) -> LogicalObserver) {
            TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
        }
    }

    override fun ask(invocation: PredicateInvocation): Boolean {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun tell(invocation: PredicateInvocation) {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun reactivate(occ: Occurrence) {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun evaluate(occ: Occurrence): StoreView {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun storeView(): StoreView {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun offerMatch(match: RuleMatchEx, inStatus: FeedbackStatus): FeedbackStatus {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun processBody(match: RuleMatchEx, inStatus: FeedbackStatus): FeedbackStatus {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}

class ConjBuilder(val type: Class<out AndItem>) {
    val constraints = ArrayList<AndItem>()

    fun createConstraint(args: Array<out Any>, id: String): Constraint {
        return MockConstraint(ConstraintSymbol(id, args.size), * args)
    }

    fun add(item: AndItem): Unit {
        if (!type.isAssignableFrom(item.javaClass))
            throw IllegalArgumentException("unexpected constraint class '${item.javaClass}'")
        constraints.add(item)

    }

    @Suppress("UNCHECKED_CAST")
    fun <T : AndItem> toArray(): Array<T> =
        if (Constraint::class.java.isAssignableFrom(type))
            Array<Constraint>(constraints.size) {
                constraints.get(it) as Constraint
            } as Array<T>
        else if (Predicate::class.java.isAssignableFrom(type))
            Array<Predicate>(constraints.size) {
                constraints.get(it) as Predicate
            } as Array<T>
        else
            Array<AndItem>(constraints.size) {
                constraints.get(it)
            } as Array<T>
}

private fun buildConjunction(type: Class<out AndItem>,
                             content: Array<out ConjBuilder.() -> Unit>): ConjBuilder {
    val conjBuilder = ConjBuilder(type)
    for (c in content) {
        conjBuilder.c()
    }
    return conjBuilder
}
