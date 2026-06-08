impl Solution {
    pub fn min_path_sum(grid: Vec<Vec<i32>>) -> i32 {
        let rows = grid.len();
        let cols = grid[0].len();
        let mut dp = vec![0; cols];
        dp[0] = grid[0][0];

        for col in 1..cols {
            dp[col] = dp[col - 1] + grid[0][col];
        }

        for row in 1..rows {
            dp[0] += grid[row][0];
            for col in 1..cols {
                dp[col] = dp[col].min(dp[col - 1]) + grid[row][col];
            }
        }

        dp[cols - 1]
    }
}
