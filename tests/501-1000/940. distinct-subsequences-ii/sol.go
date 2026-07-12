func distinctSubseqII(s string) int {
    n := len(s)
    mod := 1000000007
    dp := make([]int, n)
    dp[0] = 2
    mp := make(map[byte]int)
    mp[s[0]] = 0
    for i := 1; i < n; i++ {
        dp[i] = (2 * dp[i-1]) % mod
        if idx, ok := mp[s[i]]; ok {
            if idx > 0 {
                dp[i] -= dp[idx-1]
            } else {
                dp[i] -= 1
            }
            if dp[i] < 0 {
                dp[i] += mod
            }
        }
        mp[s[i]] = i
        dp[i] %= mod
    }
    return (dp[n-1] - 1 + mod) % mod
}
