impl Solution {
    pub fn restore_matrix(row_sum: Vec<i32>, col_sum: Vec<i32>) -> Vec<Vec<i32>> {
        let mut row_sum = row_sum;
        let mut col_sum = col_sum;
        let (m, n) = (row_sum.len(), col_sum.len());
        let mut matrix = vec![vec![0; n]; m];
        let (mut i, mut j) = (0, 0);
        while i < m && j < n {
            let val = row_sum[i].min(col_sum[j]);
            matrix[i][j] = val;
            row_sum[i] -= val;
            col_sum[j] -= val;
            if row_sum[i] == 0 { i += 1; }
            if col_sum[j] == 0 { j += 1; }
        }
        matrix
    }
}
