class Solution {
    fun cherryPickup(grid: Array<IntArray>): Int {
        val n = grid.size
        
        val dp = Array(n) { IntArray(n) { Int.MIN_VALUE } }
        dp[0][0] = 0
        
        for (k in 0..2 * (n - 1)) {
            val newDp = Array(n) { IntArray(n) { Int.MIN_VALUE } }
            
            for (x1 in 0 until n) {
                val y1 = k - x1
                if (y1 !in 0 until n) continue
                
                for (x2 in 0 until n) {
                    val y2 = k - x2
                    if (y2 !in 0 until n) continue
                    
                    if (grid[x1][y1] == -1 || grid[x2][y2] == -1) continue
                    
                    var best = dp[x1][x2]
                    if (x1 > 0) best = maxOf(best, dp[x1-1][x2])
                    if (x2 > 0) best = maxOf(best, dp[x1][x2-1])
                    if (x1 > 0 && x2 > 0) best = maxOf(best, dp[x1-1][x2-1])
                    
                    if (best == Int.MIN_VALUE) continue
                    
                    best += grid[x1][y1]
                    if (x1 != x2) best += grid[x2][y2]
                    
                    newDp[x1][x2] = best
                }
            }
            
            for (i in 0 until n) {
                for (j in 0 until n) {
                    dp[i][j] = newDp[i][j]
                }
            }
        }
        
        return maxOf(0, dp[n-1][n-1])
    }
}
