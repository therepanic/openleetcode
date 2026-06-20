func getMoneyAmount(n int) int {
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, n+1)
    }
    for length := 2; length <= n; length++ {
        for start := n - length + 1; start >= 1; start-- {
            end := start + length - 1
            dp[start][end] = int(^uint(0) >> 1)
            for pivot := start; pivot <= end; pivot++ {
                left := 0
                if pivot > start {
                    left = dp[start][pivot-1]
                }
                right := 0
                if pivot < end {
                    right = dp[pivot+1][end]
                }
                maxSide := left
                if right > maxSide {
                    maxSide = right
                }
                if pivot+maxSide < dp[start][end] {
                    dp[start][end] = pivot + maxSide
                }
            }
        }
    }
    return dp[1][n]
}
