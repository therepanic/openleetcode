func palindromePartition(s string, k int) int {
    n := len(s)
    c := make([][]int, n)
    for i := range c {
        c[i] = make([]int, n)
    }
    for l := 2; l <= n; l++ {
        for i := 0; i <= n-l; i++ {
            j := i + l - 1
            prev := 0
            if l > 2 {
                prev = c[i+1][j-1]
            }
            add := 0
            if s[i] != s[j] {
                add = 1
            }
            c[i][j] = prev + add
        }
    }
    dp := make([][]int, k+1)
    for i := range dp {
        dp[i] = make([]int, n+1)
        for j := range dp[i] {
            dp[i][j] = 1 << 30
        }
    }
    dp[0][0] = 0
    for i := 1; i <= n; i++ {
        dp[1][i] = c[0][i-1]
    }
    for p := 2; p <= k; p++ {
        for i := p; i <= n; i++ {
            mn := 1 << 30
            for t := p - 1; t < i; t++ {
                val := dp[p-1][t] + c[t][i-1]
                if val < mn {
                    mn = val
                }
            }
            dp[p][i] = mn
        }
    }
    return dp[k][n]
}
