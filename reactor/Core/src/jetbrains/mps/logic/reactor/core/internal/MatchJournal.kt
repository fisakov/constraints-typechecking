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
import jetbrains.mps.logic.reactor.evaluation.*
import jetbrains.mps.logic.reactor.program.*
import jetbrains.mps.logic.reactor.util.Id
import java.util.*


interface MatchJournal : MutableIterable<MatchJournal.Chunk> {

    /**
     * Add new [Chunk] for matches of principal rules.
     * Log occurrences discarded by match in current [Chunk].
     * Returns added [Chunk], null for non-principal rules.
     */
    fun logMatch(match: RuleMatch): MatchChunk?

    /**
     * Log occurrence activation in current [Chunk].
     * Returns added [Chunk], null for non-principal occurrences.
     */
    fun logActivation(occ: Occurrence): OccChunk?

    /**
     * Returns nearest MatchChunk which justifies current chunk.
     * If current chunk is [MatchChunk], then it is returned.
     * May return initial chunk. For initial chunk case returns it.
     */
    fun ancestorMatch(): MatchChunk

    /**
     * Current position at the journal.
     */
    fun currentPos(): Pos

    /**
     * Indicates whether journal's pos points to its end.
     */
    fun isFront(): Boolean


    /**
     * Reset journal's position to the beginning, don't modify journal.
     */
    fun resetPos()

    /**
     * Erase part of the journal between current and specified positions.
     * Resets journal position to specified position.
     * @param pastPos position to reset to.
     * @throws IllegalStateException when position is not from the past (relative to current pos).
     */
    fun reset(pastPos: Pos)

    /**
     * Replay activated and discarded occurrences logged in journal between current and provided positions.
     * Advances journal position to specified position.
     * @throws IllegalStateException when position is not from the future (relative to current pos).
     */
    fun replay(observable: LogicalStateObservable, futurePos: Pos)

    /**
     * Same as [replay] but stops at the last descendant of [ancestor] if [until] isn't found before that.
     * Suitable for "restricted" replay to [Pos] that can be already invalid (i.e. not in [MatchJournal]).
     */
    fun replayDescendants(observable: LogicalStateObservable, ancestor: Chunk, until: Pos)


    /**
     * Returns snapshot of the journal.
     */
    fun view(): View

    /**
     * Returns [StoreView] of the journal from the beginning to its current position.
     */
    fun storeView(): StoreView

    /**
     * Returns [Index] for current state of [MatchJournal].
     */
    fun index(): Index


    /**
     * Simplifies some search operations on [MatchJournal].
     * Also serves as a comparator for positions: later in journal means greater.
     */
    interface Index : Comparator<Pos> {
        /**
         * Returns [Chunk] where provided principal occurrence was activated.
         * Returns null for non-principal occurrences.
         */
        fun activatingChunkOf(occId: Id<Occurrence>): OccChunk?

        /**
         * Returns [Pos] at which provided [RuleMatch] is triggered
         * according to its indexed head [Occurrence]s.
         * May return null for matches of non-principal rules.
         */
        fun activationPos(match: RuleMatchEx): OccChunk?

        /**
         * Length of the indexed [MatchJournal]
         */
        val size: Int
    }

    /**
     * Immutable snapshot of [MatchJournal].
     */
    data class View(private val chunks: List<Chunk>, private val nextChunkId: Int) : MatchJournalView {
        override fun getChunks(): List<Chunk> = chunks
        override fun getNextChunkId(): Int = nextChunkId
        override fun getStoreView(): StoreView = StoreViewImpl(
            chunks.flatMap { it.entriesLog() }.allOccurrences().asSequence()
        )
    }

    interface Chunk : MatchJournalChunk {
        val id: Int
        val justifications: Justs

        // fixme: hide rm-mutability
        var entries: MutableList<Entry>
        override fun entriesLog(): List<Entry> = entries

        data class Entry(val occ: Occurrence, val discarded: Boolean = false) : MatchJournalChunk.Entry {
            override fun occ(): Occurrence = occ
            override fun discarded(): Boolean = discarded
            override fun toString() = (if (discarded) '-' else '+') + occ.toString()
        }

        fun isDescendantOf(chunkId: Int): Boolean = justifications.contains(chunkId)
        fun isTopLevel(): Boolean = justifications.size() <= 1 // this condition implies that there're no ancestor chunks

        fun activatedLog(): List<Occurrence> = entriesLog().filter { !it.discarded() }.map { it.occ() }
        fun discardedLog(): List<Occurrence> = entriesLog().filter { it.discarded() }.map { it.occ() }

        /**
         * Returns the resulting collection of activated occurrences
         * without discarded (only in this chunk!) occurrences.
         */
        fun activated(): List<Occurrence> = entriesLog().allOccurrences()

        fun toPos(): Pos = Pos(this, entriesLog().size)
    }

    class MatchChunk(override val id: Int, val match: RuleMatch) : Chunk {
        override val justifications: Justs = match.headJustifications().apply { add(id) }

        override var entries: MutableList<Chunk.Entry> = mutableListOf()

        override fun entriesLog(): List<Chunk.Entry> = entries

        override fun toString() = "(id=$id, $justifications, ${match.rule().tag()}, $entries)"
    }

    class OccChunk(override val id: Int, val occ: Occurrence) : Chunk {
        init { occ.justifications.add(id) }

        override val justifications: Justs
            get() = occ.justifications

        override var entries: MutableList<Chunk.Entry> = mutableListOf()

        override fun toString() = "(id=$id, $justifications, activation of $occ)"
    }

    open class Pos(val chunk: Chunk, val entriesCount: Int) {
        override fun equals(other: Any?) =
            other is Pos
            && other.chunk === chunk
            && other.entriesCount == entriesCount

        override fun hashCode(): Int = 31 * chunk.hashCode() + entriesCount

        override fun toString(): String = "($chunk, $entriesCount)"
    }

}


internal class StoreViewImpl(occurrences: Sequence<Occurrence>) : StoreView {

    val allOccurrences = occurrences.toSet()

    val allSymbols = allOccurrences.map { co -> co.constraint().symbol() }.toSet()

    override fun constraintSymbols(): Iterable<ConstraintSymbol> = allSymbols

    override fun allOccurrences(): Iterable<ConstraintOccurrence> = allOccurrences

    override fun occurrences(symbol: ConstraintSymbol): Iterable<ConstraintOccurrence> =
        allOccurrences.filter { co -> co.constraint().symbol() == symbol }.toSet()

}


private fun Iterable<MatchJournalChunk.Entry>.allOccurrences(): List<Occurrence> {
    val set = HashSet<Id<Occurrence>>()
    for (it in this) {
        val idOcc = Id(it.occ() as Occurrence)
        if (it.discarded()) set.remove(idOcc) else set.add(idOcc)
    }
    return set.map { it.wrapped }
}

