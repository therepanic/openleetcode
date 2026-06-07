class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let rows = obstacleGrid.count
        let cols = obstacleGrid[0].count
        var dp = Array(repeating: 0, count: cols)
        if obstacleGrid[0][0] == 0 {
            dp[0] = 1
        }

        for row in 0..<rows {
            for col in 0..<cols {
                if obstacleGrid[row][col] == 1 {
                    dp[col] = 0
                } else if col > 0 {
                    dp[col] += dp[col - 1]
                }
            }
        }

        return dp[cols - 1]
    }
}
