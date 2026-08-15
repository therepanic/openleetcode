class Solution {
    fun nearestValidPoint(x: Int, y: Int, points: Array<IntArray>): Int {
        var currentMinDistance = 20001
        var currentMinIndex = -1
        for (i in points.indices) {
            val a = points[i][0]
            val b = points[i][1]
            if (x == a || y == b) {
                val distance = Math.abs(x - a) + Math.abs(y - b)
                if (distance < currentMinDistance) {
                    currentMinDistance = distance
                    currentMinIndex = i
                }
            }
        }
        return currentMinIndex
    }
}
