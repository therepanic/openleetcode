func rearrangeSticks(n int, k int) int {
    mod := 1000000007
    dp := make([]int, k+1)
    dp[0] = 1
    for length := 1; length <= n; length++ {
        nxt := make([]int, k+1)
        for visible := 1; visible <= length && visible <= k; visible++ {
            nxt[visible] = (dp[visible-1] + (length-1)*dp[visible]) % mod
        }
        dp = nxt
    }
    return dp[k]
}
