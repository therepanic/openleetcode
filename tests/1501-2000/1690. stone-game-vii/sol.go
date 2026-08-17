func stoneGameVII(stones []int) int {
    n := len(stones)
    prefix := make([]int, n+1)
    
    for i := 0; i < n; i++ {
        prefix[i+1] = prefix[i] + stones[i]
    }
    
    dp := make([][]int, n)
    for i := range dp {
        dp[i] = make([]int, n)
    }

    for length := 2; length <= n; length++ {
        for i := 0; i <= n - length; i++ {
            j := i + length - 1
            total := prefix[j+1] - prefix[i]
            dp[i][j] = max(total - stones[i] - dp[i+1][j], total - stones[j] - dp[i][j-1])
        }
    }

    return dp[0][n-1]
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
