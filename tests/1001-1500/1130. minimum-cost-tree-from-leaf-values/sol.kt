class Solution {
    fun mctFromLeafValues(arr: IntArray): Int {
        var result = 0
        val st = ArrayDeque<Int>()
        st.addLast(Int.MAX_VALUE)

        for (a in arr) {
            while (st.last() <= a) {
                val mid = st.removeLast()
                result += mid * minOf(st.last(), a)
            }
            st.addLast(a)
        }

        var first = st.removeLast()
        while (st.size > 1) {
            result += first * st.last()
            first = st.removeLast()
        }

        return result
    }
}
