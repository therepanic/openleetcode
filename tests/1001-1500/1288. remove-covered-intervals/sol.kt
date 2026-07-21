class Solution {
    fun removeCoveredIntervals(intervals: Array<IntArray>): Int {
        intervals.sortWith(compareBy<IntArray> { it[0] }.thenByDescending { it[1] })
        var res = 0
        var r = 0
        for ((_, end) in intervals) {
            if (end > r) res++
            r = maxOf(r, end)
        }
        return res
    }
}
