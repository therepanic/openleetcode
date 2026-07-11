class Solution {
    fun minAreaFreeRect(points: Array<IntArray>): Double {
        var ans = Double.MAX_VALUE
        val seen = mutableMapOf<String, MutableList<Pair<Int, Int>>>()
        val n = points.size
        for (i in 0 until n) {
            val (x0, y0) = points[i]
            for (j in i + 1 until n) {
                val (x1, y1) = points[j]
                val cx = (x0 + x1) / 2.0
                val cy = (y0 + y1) / 2.0
                val d2 = (x0 - x1).toLong() * (x0 - x1) + (y0 - y1).toLong() * (y0 - y1)
                val key = "$cx,$cy,$d2"
                if (seen.containsKey(key)) {
                    for ((xx, yy) in seen[key]!!) {
                        val area = kotlin.math.sqrt(
                            ((x0 - xx).toDouble() * (x0 - xx) + (y0 - yy).toDouble() * (y0 - yy)) *
                            ((x1 - xx).toDouble() * (x1 - xx) + (y1 - yy).toDouble() * (y1 - yy))
                        )
                        ans = minOf(ans, area)
                    }
                }
                seen.getOrPut(key) { mutableListOf() }.add(Pair(x0, y0))
            }
        }
        return if (ans == Double.MAX_VALUE) 0.0 else ans
    }
}
