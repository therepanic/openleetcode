import "math"

func numSquares(n int) int {
    dp := make([]int, n+1)
    for i := 1; i <= n; i++ {
        dp[i] = math.MaxInt32
    }
    dp[0] = 0

    for i := 1; i <= n; i++ {
        for j := 1; j*j <= i; j++ {
            if dp[i] > dp[i - j*j] + 1 {
                dp[i] = dp[i - j*j] + 1
            }
        }
    }

    return dp[n]
}
