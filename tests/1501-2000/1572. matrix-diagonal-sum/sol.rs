impl Solution {
    pub fn diagonal_sum(mat: Vec<Vec<i32>>) -> i32 {
        let mut summ = 0;
        let n = mat.len();
        for i in 0..n {
            summ += mat[i][i];
            summ += mat[i][n - 1 - i];
        }
        if n % 2 == 1 {
            summ -= mat[n / 2][n / 2];
        }
        summ
    }
}
