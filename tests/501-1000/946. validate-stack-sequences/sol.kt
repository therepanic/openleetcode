class Solution {
    fun validateStackSequences(pushed: IntArray, popped: IntArray): Boolean {
        val st = ArrayDeque<Int>()
        var j = 0
        for (x in pushed) {
            st.addLast(x)
            while (!st.isEmpty() && j < popped.size && st.last() == popped[j]) {
                st.removeLast()
                j++
            }
        }
        return j == popped.size
    }
}
