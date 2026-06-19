class Solution {
    fun findRightInterval(intervals: Array<IntArray>): IntArray {
        val n = intervals.size
        val starts = Array(n) { i -> intArrayOf(intervals[i][0], i) }
        starts.sortBy { it[0] }
        val res = IntArray(n)
        for (i in intervals.indices) {
            val end = intervals[i][1]
            var left = 0
            var right = n - 1
            var idx = -1
            while (left <= right) {
                val mid = (left + right) / 2
                if (starts[mid][0] >= end) {
                    idx = starts[mid][1]
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            res[i] = idx
        }
        return res
    }
}
