func kInversePairs(n int, k int) int {
    const MOD = 1000000007
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, k+1)
    }

    for i := 1; i <= n; i++ {
        for j := 0; j <= k; j++ {
            if j == 0 {
                dp[i][j] = 1
            } else {
                val := dp[i-1][j]
                if j-i >= 0 {
                    val = (val - dp[i-1][j-i] + MOD) % MOD
                }
                dp[i][j] = (dp[i][j-1] + val) % MOD
            }
        }
    }

    result := dp[n][k]
    if k > 0 {
        result = (result - dp[n][k-1] + MOD) % MOD
    }
    return result
}
