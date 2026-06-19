class Solution {
    fun eraseOverlapIntervals(intervals: Array<IntArray>): Int {
        if (intervals.isEmpty()) return 0
        intervals.sortBy { it[1] }
        var count = 0
        var end = intervals[0][1]
        for (i in 1 until intervals.size) {
            if (end > intervals[i][0]) {
                count++
            } else {
                end = intervals[i][1]
            }
        }
        return count
    }
}
