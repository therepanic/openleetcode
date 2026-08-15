class Solution {
    fun stoneGameVII(stones: IntArray): Int {
        val n = stones.size
        val prefix = IntArray(n + 1)
        
        for (i in 0 until n) {
            prefix[i + 1] = prefix[i] + stones[i]
        }
        
        val dp = Array(n) { IntArray(n) }

        for (length in 2..n) {
            for (i in 0..(n - length)) {
                val j = i + length - 1
                val total = prefix[j + 1] - prefix[i]
                dp[i][j] = maxOf(
                    total - stones[i] - dp[i + 1][j],
                    total - stones[j] - dp[i][j - 1]
                )
            }
        }

        return dp[0][n - 1]
    }
}
