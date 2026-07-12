func profitableSchemes(n int, minProfit int, group []int, profit []int) int {
    const mod = 1_000_000_007
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, minProfit+1)
    }
    dp[0][0] = 1
    for k := 1; k <= len(group); k++ {
        g := group[k-1]
        p := profit[k-1]
        for i := n; i >= g; i-- {
            for j := minProfit; j >= 0; j-- {
                prev := 0
                if j-p >= 0 {
                    prev = dp[i-g][j-p]
                } else {
                    prev = dp[i-g][0]
                }
                dp[i][j] = (dp[i][j] + prev) % mod
            }
        }
    }
    ans := 0
    for i := 0; i <= n; i++ {
        ans = (ans + dp[i][minProfit]) % mod
    }
    return ans
}
