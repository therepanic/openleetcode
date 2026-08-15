class Solution {
    fun maxProductPath(grid: Array<IntArray>): Int {
        val r = grid.size
        val c = grid[0].size
        val MOD = 1_000_000_007L
        val dp = Array(r) { Array(c) { LongArray(2) } }
        
        var p = grid[0][0].toLong()
        dp[0][0][0] = p
        dp[0][0][1] = p
        for (j in 1 until c) {
            p *= grid[0][j]
            dp[0][j][0] = p
            dp[0][j][1] = p
        }
        
        p = grid[0][0].toLong()
        for (i in 1 until r) {
            p *= grid[i][0]
            dp[i][0][0] = p
            dp[i][0][1] = p
            for (j in 1 until c) {
                val x = grid[i][j].toLong()
                val vals = longArrayOf(x * dp[i][j-1][0], x * dp[i][j-1][1], x * dp[i-1][j][0], x * dp[i-1][j][1])
                dp[i][j][0] = vals.min()!!
                dp[i][j][1] = vals.max()!!
            }
        }
        
        val ans = dp[r-1][c-1][1]
        if (ans < 0) return -1
        return (ans % MOD).toInt()
    }
}
