/*
 * Copyright 2014-2018 JetBrains s.r.o.
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

import jetbrains.mps.logic.reactor.evaluation.EvaluationFailure

abstract class ProcessingState() {

    abstract val operational : Boolean

    inline fun eval(block: (ProcessingState) -> ProcessingState): ProcessingState =
        if (operational) block(this) else this
    
    /** Stop what is being done because a required condition is not satisfied. */
    fun abort() : ProcessingState = ABORTED(this)
    /** Failure occurred during processing. */
    fun fail(failure: EvaluationFailure) : ProcessingState = FAILED(failure, this)
    /** Reset after a failure or a cancellation, bring the state back to operational. */
    abstract fun reset() : ProcessingState

    class NORMAL : ProcessingState() {
        override val operational = true
        override fun reset(): ProcessingState = this
    }
    class FAILING(failed: FAILED) : ProcessingState() {
        override val operational = true
        override fun reset(): ProcessingState = this
    }
    class FAILED(val failure: EvaluationFailure, val going: ProcessingState) : ProcessingState() {
        override val operational = false
        override fun reset(): ProcessingState = FAILING(this)
    }
    class ABORTED(val going: ProcessingState) : ProcessingState() {
        override val operational = false
        override fun reset(): ProcessingState = going
    }
}