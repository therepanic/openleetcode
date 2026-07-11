impl Solution {
    pub fn transpose(matrix: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let row = matrix.len();
        let col = matrix[0].len();
        let mut trans = vec![vec![0; row]; col];

        for i in 0..col {
            for j in 0..row {
                trans[i][j] = matrix[j][i];
            }
        }

        trans
    }
}
