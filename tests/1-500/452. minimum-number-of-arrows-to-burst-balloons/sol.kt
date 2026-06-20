class Solution {
    fun findMinArrowShots(points: Array<IntArray>): Int {
        points.sortBy { it[1] }
        var arrows = 1
        var end = points[0][1]
        for (point in points) {
            if (point[0] > end) {
                arrows++
                end = point[1]
            }
        }
        return arrows
    }
}
