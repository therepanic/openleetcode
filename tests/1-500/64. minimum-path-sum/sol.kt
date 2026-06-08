class Solution {
    fun minPathSum(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        val dp = IntArray(cols)
        dp[0] = grid[0][0]

        for (col in 1 until cols) {
            dp[col] = dp[col - 1] + grid[0][col]
        }

        for (row in 1 until rows) {
            dp[0] += grid[row][0]
            for (col in 1 until cols) {
                dp[col] = minOf(dp[col], dp[col - 1]) + grid[row][col]
            }
        }

        return dp[cols - 1]
    }
}
