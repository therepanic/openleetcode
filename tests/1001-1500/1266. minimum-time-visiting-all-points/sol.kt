class Solution {
    fun minTimeToVisitAllPoints(points: Array<IntArray>): Int {
        var ans = 0
        for (i in 1 until points.size) {
            ans += maxOf(
                kotlin.math.abs(points[i][0] - points[i - 1][0]),
                kotlin.math.abs(points[i][1] - points[i - 1][1])
            )
        }
        return ans
    }
}
