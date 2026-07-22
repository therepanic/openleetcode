class Solution {
    fun cherryPickup(grid: Array<IntArray>): Int {
        val m = grid.size
        val n = grid[0].size
        val dp = Array(m) { Array(n) { IntArray(n) { -1 } } }
        dp[0][0][n-1] = grid[0][0] + grid[0][n-1]

        for (i in 1 until m) {
            for (j in 0 until n) {
                for (k in j+1 until n) {
                    for (x in -1..1) {
                        for (y in -1..1) {
                            val nj = j + x
                            val nk = k + y
                            if (nj in 0 until n && nk in 0 until n) {
                                val prev = dp[i-1][nj][nk]
                                if (prev != -1) {
                                    var add = grid[i][j]
                                    if (j != k) add += grid[i][k]
                                    dp[i][j][k] = maxOf(dp[i][j][k], prev + add)
                                }
                            }
                        }
                    }
                }
            }
        }

        var ans = -1
        for (row in dp[m-1])
            for (v in row)
                ans = maxOf(ans, v)
        return if (ans != -1) ans else 0
    }
}
