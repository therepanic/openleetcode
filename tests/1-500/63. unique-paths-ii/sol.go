func uniquePathsWithObstacles(obstacleGrid [][]int) int {
	rows := len(obstacleGrid)
	cols := len(obstacleGrid[0])
	dp := make([]int, cols)
	if obstacleGrid[0][0] == 0 {
		dp[0] = 1
	}

	for row := 0; row < rows; row++ {
		for col := 0; col < cols; col++ {
			if obstacleGrid[row][col] == 1 {
				dp[col] = 0
			} else if col > 0 {
				dp[col] += dp[col-1]
			}
		}
	}

	return dp[cols-1]
}
