func numPermsDISequence(s string) int {
    n := len(s)
    MOD := 1000000007
    dp := []int{1}
    for i := 1; i <= n; i++ {
        prefix := make([]int, i+1)
        prefix[0] = dp[0]
        for j := 1; j < i; j++ {
            prefix[j] = (prefix[j-1] + dp[j]) % MOD
        }
        prefix[i] = prefix[i-1] % MOD
        ndp := make([]int, i+1)
        if s[i-1] == 'I' {
            for j := 0; j <= i; j++ {
                if j > 0 {
                    ndp[j] = prefix[j-1] % MOD
                } else {
                    ndp[j] = 0
                }
            }
        } else {
            for j := 0; j <= i; j++ {
                sub := 0
                if j > 0 {
                    sub = prefix[j-1]
                }
                ndp[j] = (prefix[i-1] - sub) % MOD
                if ndp[j] < 0 {
                    ndp[j] += MOD
                }
            }
        }
        dp = ndp
    }
    sum := 0
    for _, v := range dp {
        sum = (sum + v) % MOD
    }
    return sum
}
