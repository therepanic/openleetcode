class Solution {
    fun uniquePathsWithObstacles(obstacleGrid: Array<IntArray>): Int {
        val rows = obstacleGrid.size
        val cols = obstacleGrid[0].size
        val dp = IntArray(cols)
        dp[0] = if (obstacleGrid[0][0] == 0) 1 else 0

        for (row in 0 until rows) {
            for (col in 0 until cols) {
                if (obstacleGrid[row][col] == 1) {
                    dp[col] = 0
                } else if (col > 0) {
                    dp[col] += dp[col - 1]
                }
            }
        }

        return dp[cols - 1]
    }
}
