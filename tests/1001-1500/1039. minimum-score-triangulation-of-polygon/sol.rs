impl Solution {
    pub fn min_score_triangulation(values: Vec<i32>) -> i32 {
        let n = values.len();
        let mut dp = vec![vec![0; n]; n];
        for i in (0..n).rev() {
            for j in i + 1..n {
                let mut min_val = i32::MAX;
                for k in i + 1..j {
                    let val = dp[i][k] + values[i] * values[k] * values[j] + dp[k][j];
                    if val < min_val {
                        min_val = val;
                    }
                }
                if min_val != i32::MAX {
                    dp[i][j] = min_val;
                }
            }
        }
        dp[0][n - 1]
    }
}
