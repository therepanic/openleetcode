class Solution {
    fun insert(intervals: Array<IntArray>, newInterval: IntArray): Array<IntArray> {
        val res = mutableListOf<IntArray>()
        var i = 0
        val n = intervals.size
        var start = newInterval[0]
        var end = newInterval[1]

        while (i < n && intervals[i][1] < start) {
            res.add(intervals[i])
            i++
        }

        while (i < n && intervals[i][0] <= end) {
            start = minOf(start, intervals[i][0])
            end = maxOf(end, intervals[i][1])
            i++
        }
        res.add(intArrayOf(start, end))

        while (i < n) {
            res.add(intervals[i])
            i++
        }

        return res.toTypedArray()
    }
}
