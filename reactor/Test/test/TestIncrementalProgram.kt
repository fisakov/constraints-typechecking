import jetbrains.mps.logic.reactor.core.IncrementalProgramSpec
import jetbrains.mps.logic.reactor.core.Occurrence
import jetbrains.mps.logic.reactor.core.ReactorLifecycle
import jetbrains.mps.logic.reactor.core.SessionToken
import jetbrains.mps.logic.reactor.evaluation.EvaluationResult
import jetbrains.mps.logic.reactor.evaluation.EvaluationSession
import jetbrains.mps.logic.reactor.program.Constraint
import jetbrains.mps.logic.reactor.program.ConstraintSymbol
import jetbrains.mps.logic.reactor.program.Rule as CRule
import org.junit.*
import program.MockConstraint

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

/**
 * @author Fedor Isakov
 */

class TestIncrementalProgram {

    companion object {
        @BeforeClass
        @JvmStatic
        fun setup() {
            ReactorLifecycle.init();
        }

        @AfterClass
        @JvmStatic
        fun teardown() {
            ReactorLifecycle.deinit();
        }
    }

    private class MockIncrProgSpec(val principalRuleTags: Set<Any>, val principalCtrSyms: Set<ConstraintSymbol>) : IncrementalProgramSpec {
        override fun isPrincipal(ctr: Constraint): Boolean = principalCtrSyms.contains(ctr.symbol())
        override fun isPrincipal(rule: CRule): Boolean = principalRuleTags.contains(rule.uniqueTag())
    }

    private fun Builder.launch(name: String, incrSpec: IncrementalProgramSpec, resultHandler: (EvaluationResult) -> Unit)
        : Pair<Builder, EvaluationResult>
    {
        val result = EvaluationSession.newSession(program(name))
            .withParameter(EvaluationSession.ParameterKey.of("main", Constraint::class.java), MockConstraint(ConstraintSymbol("main", 0)))
            .withIncrSpec(incrSpec)
            .start(MockSupervisor())
        result.feedback()?.let { if (it.isFailure) throw it.failureCause() }
        resultHandler(result)
        return this to result
    }

    private fun Builder.relaunch( name: String, incrSpec: IncrementalProgramSpec, sessionToken: SessionToken, resultHandler: (EvaluationResult) -> Unit )
        : Pair<Builder, EvaluationResult>
    {
        val result = EvaluationSession.newSession(program(name))
            .withParameter(EvaluationSession.ParameterKey.of("main", Constraint::class.java), MockConstraint(ConstraintSymbol("main", 0)))
            .withIncrSpec(incrSpec)
            .withSessionToken(sessionToken)
            .start(MockSupervisor())
        result.feedback()?.let { if (it.isFailure) throw it.failureCause() }
        resultHandler(result)
        return this to result
    }


    private fun EvaluationResult.lastChunk() = this.token().journalView.chunks.last()

    private fun EvaluationResult.countChunks() = this.token().journalView.chunks.size

    private fun Iterable<Occurrence>.constraintSymbols() = this.map { it.constraint.symbol() }

    private fun EvaluationResult.lastChunkSymbols() = this.lastChunk().activatedLog().constraintSymbols()


    @Test
    fun addNewMatchAtTheEnd() {
        val progSpec = MockIncrProgSpec(
            setOf("main", "foo.bar"),
            setOf(sym0("foo"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("foo")
                ))
        ).launch("addRule", progSpec) { result ->
            result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"))
            result.lastChunkSymbols() shouldBe listOf(sym0("foo"))

        }.also { (builder, evalRes) ->
            builder.programWithRules(
                rule("foo.bar",
                    headReplaced(
                        princConstraint("foo")
                    ),
                    body(
                        constraint("bar")
                    )
                )
            ).relaunch("test1", progSpec, evalRes.token()) { result ->
                result.storeView().constraintSymbols() shouldBe setOf(sym0("bar"))
                result.lastChunkSymbols() shouldBe listOf(sym0("bar"))
            }
        }
    }

    @Test
    fun addOneMoreMatch() {
        val progSpec = MockIncrProgSpec(
            setOf("main", "foo.bar", "foo.baz"),
            setOf(sym0("foo"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("foo")
                )),
            rule("foo.bar",
                headKept(
                    princConstraint("foo")
                ),
                body(
                    constraint("bar")
                )
            )
        ).launch("addRule", progSpec) { result ->
            result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"), sym0("bar"))
            result.lastChunkSymbols() shouldBe listOf(sym0("bar"))

        }.also { (builder, evalRes) ->
            builder.programWithRules(
                rule("foo.baz",
                    headKept(
                        princConstraint("foo")
                    ),
                    body(
                        constraint("baz")
                    )
                )
            ).relaunch("test1", progSpec, evalRes.token()) { result ->
                result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"), sym0("bar"), sym0("baz"))
                result.lastChunkSymbols() shouldBe listOf(sym0("baz"))
            }
        }
    }

    @Test
    fun addTwoDependentMatches() {
        val progSpec = MockIncrProgSpec(
            setOf("main", "foo.bar", "foo.baz"),
            setOf(sym0("foo"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("foo")
                ))
        ).launch("addRule", progSpec) { result ->
            result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"))

        }.also { (builder, evalRes) ->
            builder.programWithRules(
                rule("foo.bar",
                    headKept(
                        princConstraint("foo")
                    ),
                    body(
                        constraint("bar")
                    )),
                rule("foo.baz",
                    headKept(
                        princConstraint("foo"),
                        constraint("bar") // depends on the previous match being correctly logged
                    ),
                    body(
                        constraint("baz")
                    )
                )
            ).relaunch("test1", progSpec, evalRes.token()) { result ->
                result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"), sym0("bar"), sym0("baz"))
                result.lastChunkSymbols() shouldBe listOf(sym0("baz"))
            }
        }
    }

    @Test
    fun addAtStartMatch() {
        val progSpec = MockIncrProgSpec(
            setOf("main.foo", "main.bar"),
            setOf(sym0("main"))
        )
        programWithRules(
            // 'at-start' rules are launched with a 'main' occurrence, their heads aren't actually empty
            rule("main.foo",
                headKept(
                    princConstraint("main")
                ),
                body(
                    constraint("foo")
                ))
        ).launch("addRule", progSpec) { result ->

            result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"), sym0("main"))
            result.countChunks() shouldBe 2
            result.lastChunkSymbols() shouldBe listOf(sym0("foo"))

        }.also { (builder, evalRes) ->
            builder.programWithRules(
                rule("main.bar",
                    headKept(
                        princConstraint("main")
                    ),
                    body(
                        constraint("bar")
                    )
                )
            ).relaunch("atStart", progSpec, evalRes.token()) { result ->

                result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"), sym0("main"), sym0("bar"))
                result.countChunks() shouldBe 3
                result.lastChunkSymbols() shouldBe listOf(sym0("bar"))
            }
        }
    }


    @Test
    fun addMatchAfterReplaced() {
        val progSpec = MockIncrProgSpec(
            setOf("main", "main.bar"),
            setOf(sym0("main"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    princConstraint("main")
                ),
                body(
                    constraint("foo")
                ))
        ).launch("addRule", progSpec) { result ->
            result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"))

        }.also { (builder, evalRes) ->
            val nPrincipalMatches = evalRes.countChunks()

            builder.programWithRules(
                rule("main.bar",
                    headKept(
                        princConstraint("main")
                    ),
                    body(
                        constraint("bar")
                    )
                )
            ).relaunch("test1", progSpec, evalRes.token()) { result ->
                // no new matches: 'main' has been already discarded
                result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"))
                result.countChunks() shouldBe nPrincipalMatches
            }
        }
    }

    // Tests that incremental reactivation of discarded occurrences is handled correctly.
    @Test
    fun addMatchBeforeReplaced() {
        val progSpec = MockIncrProgSpec(
            setOf("main", "foo.bar", "foo.baz", "baz.dummy"),
            setOf(sym0("foo"), sym0("baz"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("foo")
                )),
            rule("foo.baz",
                headReplaced(
                    princConstraint("foo")
                ),
                body(
                    princConstraint("baz")
                )),
            rule("baz.dummy",
                headKept(
                    princConstraint("baz")
                ),
                body(
                    constraint("dummy")
                )
            )
        ).launch("initial run", progSpec) { result ->

            result.storeView().constraintSymbols() shouldBe setOf(sym0("baz"), sym0("dummy"))
            result.lastChunkSymbols() shouldBe listOf(sym0("dummy"))

        }.also { (builder, evalRes) ->
            val nPrincipalMatches = evalRes.countChunks()

            // Insert rule before foo.baz: produce bar before discarding foo in foo.baz
            builder.insertRulesAt(1,
                rule("foo.bar",
                    headKept(
                        princConstraint("foo")
                    ),
                    body(
                        constraint("bar")
                    ))
            ).relaunch("test1", progSpec, evalRes.token()) { result ->

                result.storeView().constraintSymbols() shouldBe setOf(sym0("bar"), sym0("baz"), sym0("dummy"))
                result.lastChunkSymbols() shouldBe listOf(sym0("dummy"))
                result.countChunks() shouldBe (1 + nPrincipalMatches)
            }
        }
    }

    @Test
    fun addMatchAfterKeptBeforeReplaced() {
        val progSpec = MockIncrProgSpec(
            setOf("main", "foo.bar", "foo.baz", "foo.qux"),
            setOf(sym0("foo"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("foo")
                )),
            rule("foo.bar",
                headKept(
                    princConstraint("foo")
                ),
                body(
                    constraint("bar")
                )),
            rule("foo.qux",
                headReplaced(
                    princConstraint("foo")
                ),
                body(
                    constraint("qux")
                )
            )
        ).launch("initial run", progSpec) { result ->

            result.storeView().constraintSymbols() shouldBe setOf(sym0("bar"), sym0("qux"))

        }.also { (builder, evalRes) ->
            val nPrincipalMatches = evalRes.countChunks()

            builder.insertRulesAt(2,
                rule("foo.baz",
                    headKept(
                        princConstraint("foo")
                    ),
                    body(
                        constraint("baz")
                    ))
            ).relaunch("test1", progSpec, evalRes.token()) { result ->

                result.storeView().constraintSymbols() shouldBe setOf(sym0("bar"), sym0("baz"), sym0("qux"))
                result.countChunks() shouldBe (1 + nPrincipalMatches)
            }
        }
    }

    @Test
    fun relaunchTwice() {
        val progSpec = MockIncrProgSpec(
            setOf("main", "foo.bar", "foo.baz", "baz.lax"),
            setOf(sym0("foo"), sym0("baz"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("foo")
                )),
            rule("foo.bar",
                headKept(
                    princConstraint("foo")
                ),
                body(
                    constraint("bar")
                )
            )
        ).launch("addRule", progSpec) { result ->
            result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"), sym0("bar"))

            // Add single rule and relaunch
        }.also { (builder, evalRes) ->
            builder.programWithRules(
                rule("foo.baz",
                    headKept(
                        princConstraint("foo")
                    ),
                    body(
                        princConstraint("baz")
                    )
                )
            ).relaunch("test1", progSpec, evalRes.token()) { result ->
                result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"), sym0("bar"), sym0("baz"))

            }.also { (builder, evalRes) ->
                builder.programWithRules(
                    rule("baz.lax",
                        headReplaced(
                            princConstraint("foo")
                        ),
                        headKept(
                            princConstraint("baz")
                        ),
                        body(
                            constraint("lax")
                        )
                    )
                ).relaunch("test2", progSpec, evalRes.token()) { result ->
                    result.storeView().constraintSymbols() shouldBe setOf(sym0("bar"), sym0("baz"), sym0("lax"))
                }
            }
        }
    }

    // Description: due to incremental launch, match on 'foobar' will be known
    //  before it should actually happen. If it happens earlier than needed,
    //  'bar' will be discarded too early and program results will be incorrect.
    // Tests postponedMatches logic.
    @Test
    fun futureMatchInDueTime() {
        val progSpec = MockIncrProgSpec(
            setOf(".foo", ".bar", "foobar", "bar.1st"),
            setOf(sym0("start"), sym0("foo"), sym0("bar"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("start")
                )),
            rule(".foo",
                headKept(
                    princConstraint("start")
                ),
                body(
                    princConstraint("foo")
                )),
            rule("foobar",
                headReplaced(
                    princConstraint("foo"),
                    princConstraint("bar")
                ),
                body(
                    constraint("2nd")
                )),
            rule("bar.1st",
                headKept(
                    princConstraint("bar")
                ),
                body(
                    constraint("1st")
                )
            )
        ).launch("withoutBar", progSpec) { result ->

            // "foobar" hasn't matched without 'bar, so 'foo' is still here
            result.storeView().constraintSymbols() shouldBe setOf(sym0("start"), sym0("foo"))

        }.also { (builder, evalRes) ->
            builder.insertRulesAt(1,
                rule(".bar",
                    headKept(
                        princConstraint("start")
                    ),
                    body(
                        princConstraint("bar")
                    ))
            ).relaunch("withBar", progSpec, evalRes.token()) { result ->

                // if "foobar" happens too early, "1st" occ won't be produced
                result.storeView().constraintSymbols() shouldBe setOf(sym0("start"), sym0("1st"), sym0("2nd"))
                // ensure right rule match order: the last chunk must contain "2nd"
                result.lastChunkSymbols() shouldBe listOf(sym0("2nd"))
            }
        }
    }

    // Test on complex condition involving consumedSignatures and 'reactivation' flag in RuleMatchFront.expand
    @Test
    fun reactivatePartialMatchOfPropagationRule() {
        val progSpec = MockIncrProgSpec(
            setOf(".foo", ".bar", "foobar"),
            setOf(sym0("start"), sym0("foo"), sym0("bar"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("start")
                )),
            rule(".foo",
                headReplaced(
                    princConstraint("start")
                ),
                body(
                    princConstraint("foo")
                )),
            // Propagation rule that doesn't match the first time due to the lack of 'bar'
            rule("foobar",
                headKept(
                    princConstraint("foo"),
                    princConstraint("bar")
                ),
                body(
                    constraint("marker")
                ))
        ).launch("withoutBar", progSpec) { result ->

            // "foobar" hasn't matched without 'bar, so 'foo' is still here
            result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"))

        }.also { (builder, evalRes) ->
            val nPrincipalMatches = evalRes.countChunks()

            // Provides 'bar' by reactivating 'foo'
            builder.insertRulesAt(1,
                rule(".bar",
                    headKept(
                        princConstraint("foo")
                    ),
                    body(
                        princConstraint("bar")
                    ))
            ).relaunch("withBar", progSpec, evalRes.token()) { result ->

//                println(result.token().journalView.chunks)

                // if "foobar" happens too early, "1st" occ won't be produced
                result.storeView().constraintSymbols() shouldBe setOf(sym0("foo"), sym0("bar"), sym0("marker"))
                result.lastChunkSymbols() shouldBe listOf(sym0("marker"))
                result.countChunks() shouldBe (2 + nPrincipalMatches) // +[.bar, foobar]
            }
        }
    }


    @Test
    fun rmSingleKeptMatch() {
        val progSpec = MockIncrProgSpec(
            setOf("main", "foo.bar", "foo.baz", "baz.qux"),
            setOf(sym0("foo"), sym0("baz"))
        )
        programWithRules(
            rule("main",
                headReplaced(
                    constraint("main")
                ),
                body(
                    princConstraint("foo")
                )),
            rule("foo.baz",
                headReplaced(
                    princConstraint("foo")
                ),
                body(
                    princConstraint("baz")
                )),
            rule("baz.qux",
                headKept(
                    princConstraint("baz")
                ),
                body(
                    constraint("qux")
                )
            )
        ).launch("initial run", progSpec) { result ->

            result.storeView().constraintSymbols() shouldBe setOf(sym0("baz"), sym0("qux"))
            result.lastChunkSymbols() shouldBe listOf(sym0("qux"))

        }.also { (builder, evalRes) ->
            val nPrincipalMatches = evalRes.countChunks()

            // Insert rule before foo.baz: produce bar before discarding foo in foo.baz
            builder.removeRules(listOf("baz.qux"))
                .relaunch("removed", progSpec, evalRes.token()) { result ->

                result.storeView().constraintSymbols() shouldBe setOf(sym0("baz"))
                result.lastChunkSymbols() shouldBe listOf(sym0("baz"))
                result.countChunks() shouldBe (nPrincipalMatches - 1)
            }
        }
    }
}
