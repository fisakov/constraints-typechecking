import gnu.trove.set.hash.TIntHashSet
import jetbrains.mps.logic.reactor.core.*
import jetbrains.mps.logic.reactor.core.internal.MatchHistory
import jetbrains.mps.logic.reactor.evaluation.ConstraintOccurrence
import jetbrains.mps.logic.reactor.program.ConstraintSymbol
import org.junit.Test
import org.junit.Assert.*

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


class TestMatchHistory {

    @Test
    fun testJustificationTracking() {
        val hist = MatchHistory.fromSeed()

        with(programWithRules(
            rule("rule1",
                headKept(
                    constraint("main")
                ),
                body(
                    constraint("foo")
                )),
            rule("rule2",
                headKept(
                    constraint("foo")
                ),
                body(
                    constraint("bar")
                )),
            rule("rule3",
                headKept(
                    constraint("foo")
                ),
                body(
                    constraint("qux")
                )),
            rule("rule4",
                headReplaced(
                    constraint("bar"),
                    constraint("qux")
                ),
                body(
//                    constraint("blin")
                ))))
        {

            var d = Dispatcher(RuleIndex(handlers)).fringe()
            val mainOcc = justifiedOccurrence("main", setOf(0))
//            hist.logOccurence(mainOcc) // plays a role of the initial constraint, with no preceding RuleMatch
            d = d.expand(mainOcc)

            with(d.matches()) {
                count() shouldBe 1

                with(first()) {
                    hist.logMatch(this)
                    rule().tag() shouldBe "rule1"

                    hist.current().justifications shouldBe TIntHashSet(setOf(0))
                    val fooOcc = justifiedOccurrence("foo", hist.current().justifications)
                    hist.logOccurence(fooOcc)
                    d = d.expand(fooOcc)
                }
            }

            with(d.matches()) {
                count() shouldBe 2

                with(elementAt(0)) {
                    hist.logMatch(this)
                    rule().tag() shouldBe "rule2"

                    hist.current().justifications shouldBe TIntHashSet(setOf(0,1))
                    val barOcc = justifiedOccurrence("bar", hist.current().justifications)
                    hist.logOccurence(barOcc)
                    d = d.expand(barOcc)

                    with(d.matches()) {
                        count() shouldBe 0
                    }
                }

                with(elementAt(1)) {
                    hist.logMatch(this)
                    rule().tag() shouldBe "rule3"

                    hist.current().justifications shouldBe TIntHashSet(setOf(0,2))
                    val quxOcc = justifiedOccurrence("qux", hist.current().justifications)
                    hist.logOccurence(quxOcc)
                    d = d.expand(quxOcc)

                    with(d.matches()) {
                        count() shouldBe 1

                        with(first()) {
                            hist.logMatch(this)
                            rule().tag() shouldBe "rule4"
                        }
                        hist.current().justifications shouldBe TIntHashSet(setOf(0,1,2,3))
                    }
                }
            }
        }
    }


    @Test
    fun testResetThenRoll() {
        val hist = MatchHistory.fromSeed()

        with(programWithRules(
            rule("rule1",
                headKept(
                    constraint("main")
                ),
                body(
                    constraint("foo")
                )),
            rule("rule2",
                headKept(
                    constraint("foo")
                ),
                body(
                    constraint("bar")
                )),
            rule("rule3",
                headReplaced(
                    constraint("bar"),
                    constraint("foo")
                ),
                body(
                    constraint("qux")
                ))
            ))
        {

            var d = Dispatcher(RuleIndex(handlers)).fringe()
            val mainOcc = justifiedOccurrence("main", setOf(0))
//            hist.logOccurence(mainOcc) // plays a role of the initial constraint, with no preceding RuleMatch
            d = d.expand(mainOcc)

            with(d.matches().first()) {
                hist.logMatch(this)
            }
            val fooOcc = justifiedOccurrence("foo", hist.current().justifications)
            hist.logOccurence(fooOcc)
            d = d.expand(fooOcc)


            with(d.matches().first()) {
                hist.logMatch(this)
            }
            val barOcc = justifiedOccurrence("bar", hist.current().justifications)
            hist.logOccurence(barOcc)
            d = d.expand(barOcc)

            with(d.matches().first()) {
                hist.logMatch(this)
            }
            val quxOcc = justifiedOccurrence("qux", hist.current().justifications)
            hist.logOccurence(quxOcc)
            d = d.expand(quxOcc)

            // 'rollTo' to the saved pos after full 'resetStore' must restore the store

            val oldStore = hist.storeView().allOccurrences()
            oldStore.count() shouldBe 1
            val savedPos = hist.currentPos()

            hist.resetStore()
            hist.storeView().allOccurrences().count() shouldBe 0

            hist.rollTo(savedPos)
            hist.storeView().allOccurrences() shouldBe oldStore
            hist.currentPos().chunk() shouldBe savedPos.chunk()
            hist.currentPos().occsRetained() shouldBe savedPos.occsRetained()
        }
    }

    @Test
    fun testPushExecReset() {
        val hist = MatchHistory.fromSeed()

        with(programWithRules(
            rule("rule1",
                headKept(
                    princConstraint("main")
                ),
                body(
                    princConstraint("foo")
                )),
            rule("rule2",
                headKept(
                    princConstraint("foo")
                ),
                body(
                    constraint("bar"),
                    constraint("bazz"),
                    princConstraint("qux")
                )),
            rule("rule3",
                headReplaced(
                    constraint("bar"),
                    constraint("bazz")
                ),
                body(
                    constraint("bazz")
                )),
            rule("rule4",
            headKept(
                princConstraint("qux"),
                princConstraint("foo")
            ),
            body(
                constraint("last")
            ))
        ))
        {

            var d = Dispatcher(RuleIndex(handlers)).fringe()
            val mainOcc = justifiedOccurrence("main", setOf(0))
            d = d.expand(mainOcc)

            with(d.matches().first()) {
                rule().tag() shouldBe "rule1"
                hist.logMatch(this)
            }
            val fooOcc = justifiedOccurrence("foo", hist.current().justifications)
            hist.logOccurence(fooOcc)
            d = d.expand(fooOcc)


            with(d.matches().first()) {
                rule().tag() shouldBe "rule2"
                hist.logMatch(this)
            }
            val barOcc = occurrence("bar")
            val bazzOcc = occurrence("bazz")
            val quxOcc = justifiedOccurrence("qux", hist.current().justifications)
            hist.logOccurence(barOcc)
            d = d.expand(barOcc)
            hist.logOccurence(bazzOcc)
            d = d.expand(bazzOcc)


            val curChunk = hist.current()
            with(d.matches().first()) {
                rule().tag() shouldBe "rule3"
                hist.logMatch(this)
            }
            // matched on rule with heads without justifications, should remain in the same chunk
            hist.current() shouldBeSame curChunk

            val bazzOcc2 = occurrence("bazz")
            hist.logOccurence(bazzOcc2)
            d = d.expand(bazzOcc2)

            val oldState = hist.view()
            val oldStore = hist.storeView().allOccurrences()
            val savedPos = hist.currentPos()
            hist.push()


            hist.logOccurence(quxOcc)
            d = d.expand(quxOcc)


            with(d.matches().first()) {
                rule().tag() shouldBe "rule4"
                hist.view().chunks.size shouldBe 2
                hist.logMatch(this)
                hist.view().chunks.size shouldBe 3
            }
            val lastOcc = occurrence("last")
            hist.logOccurence(lastOcc)
            d = d.expand(lastOcc)


            assertNotEquals(oldState.chunks, hist.view().chunks)
            assertNotEquals(oldStore, hist.storeView().allOccurrences())
            hist.reset(savedPos)
            hist.view().chunks shouldBe oldState.chunks
            hist.storeView().allOccurrences() shouldBe oldStore

            hist.currentPos().chunk() shouldBe savedPos.chunk()
            hist.currentPos().occsRetained() shouldBe savedPos.occsRetained()
        }
    }

    @Test
    fun testRmAddInMiddle() {
        val hist = MatchHistory.fromSeed()

        with(programWithRules(
            rule("rule0",
                headKept(
                    princConstraint("main")
                ),
                body(
                    princConstraint("foo")
                )),
            rule("rule1",
                headKept(
                    princConstraint("foo")
                ),
                body(
                    // 'bar' occurrences are activated manually, see test code
//                    constraint("bar1"),
//                    constraint("bar2"),
                    princConstraint("bazz")
                )),

            rule("rule2a",
                headReplaced(
                    constraint("bar1")
                ),
                headKept(
                    princConstraint("bazz")
                ),
                body()),
            rule("rule2b",
                headKept(
                    constraint("bar2"),
                    princConstraint("bazz")
                ),
                body(
                    princConstraint("qux")
                )),

            rule("rule3",
                headKept(
                    princConstraint("foo"),
                    princConstraint("bazz")
                ),
                body(
                    princConstraint("qux")
                )),
            rule("ruleMakeP",
                headReplaced(
                    princConstraint("qux")
                ),
                body(
//                    constraint("p")
                    princConstraint("p")
                ))
        ))
        {
            // Test outline:
            //  1) exec program
            //  2) rm chunk (rule match) from the history middle
            //  3) add something instead of removed rule match
            //  4) apply the still valid future, that's left from the first exec
            //
            // fst exec: rule1 -> rule2a -> rule3 -> ruleMakeP
            // snd exec: rule1 -> rule2b -> ruleMakeP -> rule3 -> ruleMakeP

            var d = Dispatcher(RuleIndex(handlers)).fringe()
            val mainOcc = justifiedOccurrence("main", setOf(0))
            d = d.expand(mainOcc)

            with(d.matches().first()) {
                rule().tag() shouldBe "rule0"
                hist.logMatch(this)
            }
            val fooOcc = justifiedOccurrence("foo", hist.current().justifications)
            hist.logOccurence(fooOcc); d = d.expand(fooOcc)


            with(d.matches().first()) {
                rule().tag() shouldBe "rule1"
                hist.logMatch(this)
            }
            val bar1Occ = occurrence("bar1")
            val bazzOcc = justifiedOccurrence("bazz", hist.current().justifications)
            hist.logOccurence(bar1Occ); d = d.expand(bar1Occ)
            hist.logOccurence(bazzOcc); d = d.expand(bazzOcc)


            val rule1matches = d.matches()
            rule1matches.count() shouldBe 2
            with(rule1matches.first()) {
                rule().tag() shouldBe "rule2a"
                hist.logMatch(this)
            }
            //no productions in rule2a

            // this rule match will remain in history untouched
            with(rule1matches.last()) {
                rule().tag() shouldBe "rule3"
                hist.logMatch(this)
            }
            val quxOcc0 = justifiedOccurrence("qux", hist.current().justifications)
            hist.logOccurence(quxOcc0); d = d.expand(quxOcc0)


            with(d.matches().first()) {
                rule().tag() shouldBe "ruleMakeP"
                hist.logMatch(this)
            }
//            val pOcc1 = occurrence("p")
            val pOcc1 = justifiedOccurrence("p", hist.current().justifications)
            hist.logOccurence(pOcc1); d = d.expand(pOcc1)


            // execution has ended
            hist.view().chunks.size shouldBe 5
            val lastChunk = hist.current()

            // bar1 was discarded by rule2a, so it shouldn't be in the store
            val bar1StoredBeforeRoll = hist.storeView().occurrences(ConstraintSymbol.symbol("bar1", 0))
            bar1StoredBeforeRoll.count() shouldBe 0

            // walk by history, remove the third chunk (i.e. match of rule2a)
            //  continue from the second chunk (match of rule1)
            val rmIt = hist.removeIterator()
            rmIt.next()
            val continueFrom = rmIt.next()
            rmIt.next()
            rmIt.remove()

            // store is not longer valid after removing chunks from history, so reset it
            hist.resetStore()
            // move to the point where we want to insert new rule
            hist.rollTo(continueFrom)

            // we removed (canceled) rule discarding bar1, so after roll we should have it in the store
            val bar1StoredAfterRoll = hist.storeView().occurrences(ConstraintSymbol.symbol("bar1", 0))
            bar1StoredAfterRoll.count() shouldBe 1


            // add another instance of bar (i.e. bar2) and trigger another rule, rule2b
            //  bar2 plays a role of the reactivation of original bar
            val bar2Occ = occurrence("bar2")
            hist.logOccurence(bar2Occ); d = d.expand(bar2Occ)
//            hist.logOccurence(bazzOcc); d = d.expand(bazzOcc) // it is already produced

            // we have only a single _new_ match; rule3 has been matched already and remains in the history, in future
            d.matches().count() shouldBe 1
            // this rule match is added at the place of rule2a match
            with(d.matches().first()) {
                rule().tag() shouldBe "rule2b"
                hist.logMatch(this)
            }
            val quxOcc1 = justifiedOccurrence("qux", hist.current().justifications)
            hist.logOccurence(quxOcc1); d = d.expand(quxOcc1)
            hist.view().chunks.size shouldBe (3 + 1 + 1) // past + new added + future


            d.matches().count() shouldBe 1
            with(d.matches().first()) {
                rule().tag() shouldBe "ruleMakeP"
                hist.logMatch(this)
            }
//            val pOcc2 = occurrence("p")
            val pOcc2 = justifiedOccurrence("p", hist.current().justifications)
            hist.logOccurence(pOcc2); d = d.expand(pOcc2)


            val pStoredBeforeRoll = hist.storeView().occurrences(ConstraintSymbol.symbol("p", 0))
            pStoredBeforeRoll.count() shouldBe 1
            // todo?: check history before roll

            // finally, purely go the the end, applying the rest of the history to the store
            assertNotEquals(lastChunk, hist.current())
            hist.rollTo(lastChunk)

            hist.view().chunks.size shouldBe 6
            hist.current() shouldBeSame lastChunk // we inserted in the middle -- the last chunk should remain the same

            println(hist.view().toString())
            println(hist.storeView().allOccurrences().toString())

            //somehow fails if 'p' is an occ without justifications! e.g. with equal null sets
            // e.g. see this: println(setOf(pOcc1, pOcc2))
            val pStoredAfterRoll = hist.storeView().occurrences(ConstraintSymbol.symbol("p", 0))
            pStoredAfterRoll.count() shouldBe 2
            // todo?: check history after roll

        }
    }
}