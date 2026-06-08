class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var dp = Array(repeating: 0, count: cols)
        dp[0] = grid[0][0]

        if cols > 1 {
            for col in 1..<cols {
                dp[col] = dp[col - 1] + grid[0][col]
            }
        }

        if rows > 1 {
            for row in 1..<rows {
                dp[0] += grid[row][0]
                if cols > 1 {
                    for col in 1..<cols {
                        dp[col] = min(dp[col], dp[col - 1]) + grid[row][col]
                    }
                }
            }
        }

        return dp[cols - 1]
    }
}
