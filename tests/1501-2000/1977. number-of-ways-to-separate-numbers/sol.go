func numberOfCombinations(num string) int {
    n := len(num)
    const MOD = 1000000007
    dp := make([][]int64, n)
    for i := range dp {
        dp[i] = make([]int64, n+1)
    }
    for i := 0; i < n; i++ {
        if num[i] != '0' {
            for j := i + 1; j <= n; j++ {
                if i == 0 {
                    dp[i][j] = 1
                } else {
                    length := j - i
                    dp[i][j] = dp[i][j-1]
                    if i-length >= 0 && num[i-length:i] <= num[i:j] {
                        dp[i][j] += dp[i-length][i]
                    }
                    if i-length+1 >= 0 && num[i-length+1:i] > num[i:j-1] {
                        dp[i][j] += dp[i-length+1][i]
                    }
                    dp[i][j] %= MOD
                }
            }
        }
    }
    var ans int64
    for i := 0; i < n; i++ {
        ans = (ans + dp[i][n]) % MOD
    }
    return int(ans)
}
