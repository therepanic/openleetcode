func mergeStones(stones []int, k int) int {
    n := len(stones)
    if (n-1)%(k-1) != 0 {
        return -1
    }
    
    prefix := make([]int, n+1)
    for i := 1; i <= n; i++ {
        prefix[i] = prefix[i-1] + stones[i-1]
    }
    
    dp := make([][][]int, n)
    for i := range dp {
        dp[i] = make([][]int, n)
        for j := range dp[i] {
            dp[i][j] = make([]int, k+1)
            for p := range dp[i][j] {
                dp[i][j][p] = 1<<31 - 1
            }
        }
    }
    
    for i := 0; i < n; i++ {
        dp[i][i][1] = 0
    }
    
    for length := 2; length <= n; length++ {
        for i := 0; i+length-1 < n; i++ {
            j := i + length - 1
            for p := 2; p <= k; p++ {
                for m := i; m < j; m += k - 1 {
                    if dp[i][m][1] != 1<<31-1 && dp[m+1][j][p-1] != 1<<31-1 {
                        val := dp[i][m][1] + dp[m+1][j][p-1]
                        if val < dp[i][j][p] {
                            dp[i][j][p] = val
                        }
                    }
                }
            }
            if dp[i][j][k] != 1<<31-1 {
                dp[i][j][1] = dp[i][j][k] + (prefix[j+1] - prefix[i])
            }
        }
    }
    
    if dp[0][n-1][1] == 1<<31-1 {
        return -1
    }
    return dp[0][n-1][1]
}
