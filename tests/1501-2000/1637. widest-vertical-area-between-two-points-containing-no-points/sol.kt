class Solution {
    fun maxWidthOfVerticalArea(points: Array<IntArray>): Int {
        var maxWidth = 0
        points.sortBy { it[0] }
        for (i in 0 until points.size - 1) {
            val width = points[i+1][0] - points[i][0]
            maxWidth = maxOf(maxWidth, width)
        }
        return maxWidth
    }
}
