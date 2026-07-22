class Solution {
    fun getMinDistSum(positions: Array<IntArray>): Double {
        fun distSum(x: Double, y: Double): Double {
            var sum = 0.0
            for (p in positions) {
                sum += Math.sqrt((x - p[0]) * (x - p[0]) + (y - p[1]) * (y - p[1]))
            }
            return sum
        }
        
        var x = positions.sumOf { it[0].toDouble() } / positions.size
        var y = positions.sumOf { it[1].toDouble() } / positions.size
        
        var ans = distSum(x, y)
        var chg = 100.0
        val dirs = arrayOf(intArrayOf(-1, 0), intArrayOf(0, -1), intArrayOf(0, 1), intArrayOf(1, 0))
        
        while (chg > 1e-6) {
            var zoom = true
            for (d in dirs) {
                val xx = x + chg * d[0]
                val yy = y + chg * d[1]
                val dd = distSum(xx, yy)
                if (dd < ans) {
                    ans = dd
                    x = xx
                    y = yy
                    zoom = false
                    break
                }
            }
            if (zoom) chg /= 2
        }
        return ans
    }
}
