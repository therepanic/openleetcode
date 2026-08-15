class Solution {
    fun visiblePoints(points: List<List<Int>>, angle: Int, location: List<Int>): Int {
        return visiblePoints(points.map { it.toIntArray() }.toTypedArray(), angle, location.toIntArray())
    }

    fun visiblePoints(points: Array<IntArray>, angle: Int, location: IntArray): Int {
        val angles = mutableListOf<Double>()
        var same = 0
        val x0 = location[0]
        val y0 = location[1]
        
        for (p in points) {
            val dx = p[0] - x0
            val dy = p[1] - y0
            if (dx == 0 && dy == 0) {
                same++
                continue
            }
            val ang = Math.toDegrees(Math.atan2(dy.toDouble(), dx.toDouble()))
            angles.add(ang)
        }
        
        if (angles.isEmpty()) return same
        
        angles.sort()
        val n = angles.size
        val full = angles + angles.map { it + 360 }
        
        var maxVis = 0
        var j = 0
        for (i in 0 until n) {
            while (j < full.size && full[j] - full[i] <= angle) {
                j++
            }
            maxVis = maxOf(maxVis, j - i)
        }
        
        return maxVis + same
    }
}
