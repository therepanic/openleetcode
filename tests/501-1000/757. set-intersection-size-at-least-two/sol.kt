class Solution {
    fun intersectionSizeTwo(intervals: Array<IntArray>): Int {
        intervals.sortWith(compareBy<IntArray> { it[1] }.thenByDescending { it[0] })
        var ans = 0
        var a = -1
        var b = -1
        for ((l, r) in intervals) {
            if (l > b) {
                a = r - 1
                b = r
                ans += 2
            } else if (l > a) {
                a = b
                b = r
                ans += 1
            }
        }
        return ans
    }
}
