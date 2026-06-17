func countBits(n int) []int {
    dp := make([]int, n + 1)
    sub := 1
    for i := 1; i <= n; i++ {
        if sub * 2 == i {
            sub = i
        }
        dp[i] = dp[i - sub] + 1
    }
    return dp
}
