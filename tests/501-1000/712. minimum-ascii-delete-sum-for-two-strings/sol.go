func minimumDeleteSum(s1 string, s2 string) int {
    n, m := len(s1), len(s2)
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, m+1)
    }
    for i := 0; i < n; i++ {
        for j := 0; j < m; j++ {
            if s1[i] == s2[j] {
                dp[i+1][j+1] = dp[i][j] + int(s1[i])
            } else {
                dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j])
            }
        }
    }
    totalAscii := 0
    for _, c := range s1 {
        totalAscii += int(c)
    }
    for _, c := range s2 {
        totalAscii += int(c)
    }
    return totalAscii - 2*dp[n][m]
}
