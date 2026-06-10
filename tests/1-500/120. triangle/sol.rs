
impl Solution {
    pub fn minimum_total(triangle: Vec<Vec<i32>>) -> i32 {
        let mut dp = triangle.last().unwrap().clone();
        for row in (0..triangle.len() - 1).rev() {
            for col in 0..triangle[row].len() {
                dp[col] = triangle[row][col] + dp[col].min(dp[col + 1]);
            }
        }
        dp[0]
    }
}
