impl Solution {
    pub fn maximal_square(matrix: Vec<Vec<String>>) -> i32 {
        if matrix.is_empty() || matrix[0].is_empty() {
            return 0;
        }
        let rows = matrix.len();
        let cols = matrix[0].len();
        let mut max_area = 0;
        let mut dp = vec![vec![0; cols]; rows];

        for r in (0..rows).rev() {
            for c in (0..cols).rev() {
                if matrix[r][c] == "1" {
                    let down = if r + 1 < rows { dp[r + 1][c] } else { 0 };
                    let right = if c + 1 < cols { dp[r][c + 1] } else { 0 };
                    let diag = if r + 1 < rows && c + 1 < cols { dp[r + 1][c + 1] } else { 0 };
                    dp[r][c] = 1 + down.min(right).min(diag);
                } else {
                    dp[r][c] = 0;
                }
                max_area = max_area.max(dp[r][c]);
            }
        }
        max_area * max_area
    }
}
