func minScoreTriangulation(values []int) int {
    n := len(values)
    dp := make([][]int, n)
    for i := range dp {
        dp[i] = make([]int, n)
    }
    for i := n - 1; i >= 0; i-- {
        for j := i + 1; j < n; j++ {
            minVal := int(^uint(0) >> 1)
            for k := i + 1; k < j; k++ {
                val := dp[i][k] + values[i]*values[k]*values[j] + dp[k][j]
                if val < minVal {
                    minVal = val
                }
            }
            if minVal != int(^uint(0)>>1) {
                dp[i][j] = minVal
            }
        }
    }
    return dp[0][n-1]
}
