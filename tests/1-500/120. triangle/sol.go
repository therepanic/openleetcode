
func minimumTotal(triangle [][]int) int {
    dp := append([]int(nil), triangle[len(triangle)-1]...)
    for row := len(triangle) - 2; row >= 0; row-- {
        for col := 0; col <= row; col++ {
            if dp[col] < dp[col+1] {
                dp[col] = triangle[row][col] + dp[col]
            } else {
                dp[col] = triangle[row][col] + dp[col+1]
            }
        }
    }
    return dp[0]
}
