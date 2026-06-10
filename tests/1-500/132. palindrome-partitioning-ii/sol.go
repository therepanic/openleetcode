func minCut(s string) int {
    n := len(s)
    isPal := make([][]bool, n)
    for i := range isPal { isPal[i] = make([]bool, n) }
    for end := 0; end < n; end++ {
        for start := 0; start <= end; start++ {
            if s[start] == s[end] && (end-start <= 2 || isPal[start+1][end-1]) { isPal[start][end] = true }
        }
    }
    dp := make([]int, n)
    for i := 0; i < n; i++ {
        if isPal[0][i] { dp[i] = 0 } else {
            dp[i] = i
            for j := 0; j < i; j++ { if isPal[j+1][i] && dp[j]+1 < dp[i] { dp[i] = dp[j] + 1 } }
        }
    }
    return dp[n-1]
}
