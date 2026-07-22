func numberOfArrays(s string, k int) int {
    mod := 1000000007
    n := len(s)
    dp := make([]int, n+1)
    dp[0] = 1
    width := len(fmt.Sprint(k))
    for i := 0; i < n; i++ {
        if s[i] == '0' || dp[i] == 0 {
            continue
        }
        value := 0
        for j := i; j < n && j < i+width; j++ {
            value = value*10 + int(s[j]-'0')
            if value > k {
                break
            }
            dp[j+1] = (dp[j+1] + dp[i]) % mod
        }
    }
    return dp[n]
}
