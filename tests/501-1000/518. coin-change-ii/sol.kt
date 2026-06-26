class Solution {
    fun change(amount: Int, coins: IntArray): Int {
        val n = coins.size
        val dp = Array(n + 1) { IntArray(amount + 1) }
        
        for (i in 0..n) {
            dp[i][0] = 1
        }
        
        for (i in 1..n) {
            for (j in 1..amount) {
                if (coins[i-1] <= j) {
                    dp[i][j] = dp[i][j - coins[i-1]] + dp[i-1][j]
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        
        return dp[n][amount]
    }
}
