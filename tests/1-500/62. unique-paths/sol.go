func uniquePaths(m int, n int) int {
	dp := make([]int, n)
	for i := range dp {
		dp[i] = 1
	}
	for row := 1; row < m; row++ {
		for col := 1; col < n; col++ {
			dp[col] += dp[col-1]
		}
	}
	return dp[n-1]
}
