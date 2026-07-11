impl Solution {
    pub fn min_falling_path_sum(matrix: Vec<Vec<i32>>) -> i32 {
        let m = matrix.len();
        let n = matrix[0].len();
        if m == 1 && n == 1 {
            return *matrix[0].iter().min().unwrap();
        }
        let mut dp: Vec<Vec<Option<i32>>> = vec![vec![None; n]; m - 1];
        let mut mini = i32::MAX;
        fn f(i: usize, j: i32, m: usize, n: i32, matrix: &Vec<Vec<i32>>, dp: &mut Vec<Vec<Option<i32>>>) -> i32 {
            if j >= n || j < 0 {
                return i32::MAX;
            }
            let j = j as usize;
            if i == m - 1 {
                return matrix[i][j];
            }
            if let Some(val) = dp[i][j] {
                return val;
            }
            let down = matrix[i][j].saturating_add(f(i + 1, j as i32, m, n as i32, matrix, dp));
            let leftd = matrix[i][j].saturating_add(f(i + 1, j as i32 - 1, m, n as i32, matrix, dp));
            let rightd = matrix[i][j].saturating_add(f(i + 1, j as i32 + 1, m, n as i32, matrix, dp));
            let min_val = down.min(leftd).min(rightd);
            dp[i][j] = Some(min_val);
            min_val
        }
        for col in 0..n {
            mini = mini.min(f(0, col as i32, m, n as i32, &matrix, &mut dp));
        }
        mini
    }
}
