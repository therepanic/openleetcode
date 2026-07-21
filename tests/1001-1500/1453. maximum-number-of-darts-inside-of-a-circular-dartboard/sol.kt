class Solution {
    fun numPoints(darts: Array<IntArray>, r: Int): Int {
        var ans = 1
        val radius = r.toDouble()
        val radiusSq = radius * radius
        for (i in darts.indices) {
            val x1 = darts[i][0].toDouble()
            val y1 = darts[i][1].toDouble()
            for (j in i + 1 until darts.size) {
                val x2 = darts[j][0].toDouble()
                val y2 = darts[j][1].toDouble()
                val dx = x2 - x1
                val dy = y2 - y1
                val distanceSq = dx * dx + dy * dy
                if (distanceSq > 4.0 * radiusSq) continue
                val distance = Math.sqrt(distanceSq)
                val midpointX = (x1 + x2) / 2.0
                val midpointY = (y1 + y2) / 2.0
                val offset = Math.sqrt(maxOf(0.0, radiusSq - distanceSq / 4.0))
                val normalX = -dy / distance
                val normalY = dx / distance
                for (sign in doubleArrayOf(-1.0, 1.0)) {
                    val centerX = midpointX + sign * offset * normalX
                    val centerY = midpointY + sign * offset * normalY
                    var count = 0
                    for (dart in darts) {
                        val ex = dart[0] - centerX
                        val ey = dart[1] - centerY
                        if (ex * ex + ey * ey <= radiusSq + 1e-9) count++
                    }
                    ans = maxOf(ans, count)
                }
            }
        }
        return ans
    }
}
