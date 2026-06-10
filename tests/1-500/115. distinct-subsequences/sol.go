
func numDistinct(s string, t string) int {
    dp := make([]int64, len(t)+1)
    dp[0] = 1
    for i := 0; i < len(s); i++ {
        for j := len(t) - 1; j >= 0; j-- {
            if s[i] == t[j] {
                dp[j+1] += dp[j]
            }
        }
    }
    return int(dp[len(t)])
}
