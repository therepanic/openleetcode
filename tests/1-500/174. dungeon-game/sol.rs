impl Solution {
    pub fn calculate_minimum_hp(dungeon: Vec<Vec<i32>>) -> i32 {
        let rows = dungeon.len();
        let cols = dungeon[0].len();
        let mut dp = vec![vec![0; cols]; rows];
        dp[rows - 1][cols - 1] = (1 - dungeon[rows - 1][cols - 1]).max(1);
        for r in (0..rows - 1).rev() { dp[r][cols - 1] = (dp[r + 1][cols - 1] - dungeon[r][cols - 1]).max(1); }
        for c in (0..cols - 1).rev() { dp[rows - 1][c] = (dp[rows - 1][c + 1] - dungeon[rows - 1][c]).max(1); }
        for r in (0..rows - 1).rev() {
            for c in (0..cols - 1).rev() {
                dp[r][c] = (dp[r + 1][c].min(dp[r][c + 1]) - dungeon[r][c]).max(1);
            }
        }
        dp[0][0]
    }
}
