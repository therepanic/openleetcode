class Solution {
    fun coinChange(coins: IntArray, amount: Int): Int {
        val dp = IntArray(amount + 1) { amount + 1 }
        dp[0] = 0
        
        for (i in 1..amount) {
            for (coin in coins) {
                if (i - coin >= 0) {
                    dp[i] = minOf(dp[i], 1 + dp[i - coin])
                }
            }
        }
        
        return if (dp[amount] != amount + 1) dp[amount] else -1
    }
}
