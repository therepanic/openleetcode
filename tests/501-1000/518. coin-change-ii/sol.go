func change(amount int, coins []int) int {
    n := len(coins)
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, amount+1)
        dp[i][0] = 1
    }
    
    for i := 1; i <= n; i++ {
        for j := 1; j <= amount; j++ {
            if coins[i-1] <= j {
                dp[i][j] = dp[i][j-coins[i-1]] + dp[i-1][j]
            } else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }
    
    return dp[n][amount]
}
