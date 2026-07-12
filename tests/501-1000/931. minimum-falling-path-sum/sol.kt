class Solution {
    fun minFallingPathSum(matrix: Array<IntArray>): Int {
        val m = matrix.size
        val n = matrix[0].size
        var dp = matrix[0].clone()
        for (i in 1 until m) {
            val ndp = IntArray(n)
            for (j in 0 until n) {
                var best = dp[j]
                if (j > 0) best = minOf(best, dp[j - 1])
                if (j + 1 < n) best = minOf(best, dp[j + 1])
                ndp[j] = matrix[i][j] + best
            }
            dp = ndp
        }
        return dp.min()
    }
}
