func coinChange(coins []int, amount int) int {
    dp := make([]int, amount + 1)
    for i := range dp {
        dp[i] = amount + 1
    }
    dp[0] = 0
    
    for i := 1; i <= amount; i++ {
        for _, coin := range coins {
            if i - coin >= 0 {
                if 1 + dp[i - coin] < dp[i] {
                    dp[i] = 1 + dp[i - coin]
                }
            }
        }
    }
    
    if dp[amount] != amount + 1 {
        return dp[amount]
    }
    return -1
}
