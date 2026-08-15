class Solution {
    fun maxPoints(points: Array<IntArray>): Long {
        val m = points.size
        val n = points[0].size
        
        var dp = LongArray(n) { points[0][it].toLong() }
        
        for (r in 1 until m) {
            val left = LongArray(n)
            val right = LongArray(n)
            
            left[0] = dp[0]
            for (c in 1 until n) {
                left[c] = maxOf(left[c-1], dp[c] + c)
            }
            
            right[n-1] = dp[n-1] - (n-1)
            for (c in n-2 downTo 0) {
                right[c] = maxOf(right[c+1], dp[c] - c)
            }
            
            val newDp = LongArray(n)
            for (c in 0 until n) {
                val best = maxOf(left[c] - c, right[c] + c)
                newDp[c] = points[r][c] + best
            }
            dp = newDp
        }
        
        return dp.max()!!
    }
}
