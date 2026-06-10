class Solution {
    fun maxPoints(points: Array<IntArray>): Int {
        if (points.size <= 2) return points.size
        var best = 0
        for (i in points.indices) {
            if (points.size - i <= best) break
            val count = HashMap<Long, Int>()
            var local = 0
            var duplicates = 1
            val x1 = points[i][0]
            val y1 = points[i][1]
            for (j in i + 1 until points.size) {
                var dx = points[j][0] - x1
                var dy = points[j][1] - y1
                if (dx == 0 && dy == 0) {
                    duplicates++
                    continue
                }
                val g = gcd(dx, dy)
                dx /= g
                dy /= g
                if (dx < 0) {
                    dx = -dx
                    dy = -dy
                } else if (dx == 0) {
                    dy = 1
                } else if (dy == 0) {
                    dx = 1
                }
                val key = pack(dx, dy)
                val next = (count[key] ?: 0) + 1
                count[key] = next
                local = maxOf(local, next)
            }
            best = maxOf(best, local + duplicates)
        }
        return best
    }

    private fun gcd(a: Int, b: Int): Int {
        var x = kotlin.math.abs(a)
        var y = kotlin.math.abs(b)
        while (y != 0) {
            val t = x % y
            x = y
            y = t
        }
        return x
    }

    private fun pack(dx: Int, dy: Int): Long {
        return (dx.toLong() shl 32) xor (dy.toLong() and 0xffffffffL)
    }
}
