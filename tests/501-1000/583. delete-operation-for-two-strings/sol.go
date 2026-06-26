func minDistance(word1 string, word2 string) int {
    n, m := len(word1), len(word2)
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, m+1)
    }

    for i := 1; i <= n; i++ {
        for j := 1; j <= m; j++ {
            if word1[i-1] == word2[j-1] {
                dp[i][j] = 1 + dp[i-1][j-1]
            } else {
                if dp[i-1][j] > dp[i][j-1] {
                    dp[i][j] = dp[i-1][j]
                } else {
                    dp[i][j] = dp[i][j-1]
                }
            }
        }
    }
    
    return n + m - 2*dp[n][m]
}
