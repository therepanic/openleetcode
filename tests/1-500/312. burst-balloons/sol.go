func maxCoins(nums []int) int {
    balloons := make([]int, len(nums)+2)
    balloons[0] = 1
    balloons[len(balloons)-1] = 1
    for i, v := range nums {
        balloons[i+1] = v
    }
    n := len(balloons)
    dp := make([][]int, n)
    for i := range dp {
        dp[i] = make([]int, n)
    }
    
    for length := 2; length < n; length++ {
        for left := 0; left < n-length; left++ {
            right := left + length
            best := 0
            for k := left + 1; k < right; k++ {
                gain := balloons[left] * balloons[k] * balloons[right]
                total := gain + dp[left][k] + dp[k][right]
                if total > best {
                    best = total
                }
            }
            dp[left][right] = best
        }
    }
    
    return dp[0][n-1]
}
