class Solution {
    fun uniquePaths(m: Int, n: Int): Int {
        val dp = IntArray(n) { 1 }
        for (row in 1 until m) {
            for (col in 1 until n) {
                dp[col] += dp[col - 1]
            }
        }
        return dp[n - 1]
    }
}
