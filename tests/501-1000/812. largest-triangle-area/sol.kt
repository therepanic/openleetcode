class Solution {
    fun largestTriangleArea(points: Array<IntArray>): Double {
        var maxArea = 0.0
        val n = points.size
        for (i in 0 until n) {
            val (x1, y1) = points[i]
            for (j in i until n) {
                val (x2, y2) = points[j]
                for (k in j until n) {
                    val (x3, y3) = points[k]
                    val area = Math.abs(0.5 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)))
                    if (area > maxArea) {
                        maxArea = area
                    }
                }
            }
        }
        return maxArea
    }
}
