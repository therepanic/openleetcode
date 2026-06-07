func minPathSum(grid [][]int) int {
	rows := len(grid)
	cols := len(grid[0])
	dp := make([]int, cols)
	dp[0] = grid[0][0]

	for col := 1; col < cols; col++ {
		dp[col] = dp[col-1] + grid[0][col]
	}

	for row := 1; row < rows; row++ {
		dp[0] += grid[row][0]
		for col := 1; col < cols; col++ {
			if dp[col-1] < dp[col] {
				dp[col] = dp[col-1] + grid[row][col]
			} else {
				dp[col] += grid[row][col]
			}
		}
	}

	return dp[cols-1]
}
