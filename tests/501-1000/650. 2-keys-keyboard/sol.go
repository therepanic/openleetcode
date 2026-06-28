func minSteps(n int) int {
    if n == 1 {
        return 0
    }
    dp := make([]int, n+1)
    for i := 2; i <= n; i++ {
        dp[i] = i
        for j := i - 1; j >= 1; j-- {
            if i%j == 0 {
                dp[i] = dp[j] + (i / j)
                break
            }
        }
    }
    return dp[n]
}
