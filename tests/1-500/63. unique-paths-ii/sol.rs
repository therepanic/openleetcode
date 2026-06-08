impl Solution {
    pub fn unique_paths_with_obstacles(obstacle_grid: Vec<Vec<i32>>) -> i32 {
        let rows = obstacle_grid.len();
        let cols = obstacle_grid[0].len();
        let mut dp = vec![0; cols];
        dp[0] = if obstacle_grid[0][0] == 0 { 1 } else { 0 };

        for row in 0..rows {
            for col in 0..cols {
                if obstacle_grid[row][col] == 1 {
                    dp[col] = 0;
                } else if col > 0 {
                    dp[col] += dp[col - 1];
                }
            }
        }

        dp[cols - 1]
    }
}
