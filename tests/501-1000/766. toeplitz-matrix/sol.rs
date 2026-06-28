impl Solution {
    pub fn is_toeplitz_matrix(matrix: Vec<Vec<i32>>) -> bool {
        let n = matrix.len();
        let m = matrix[0].len();
        
        for i in 0..n - 1 {
            for j in 0..m - 1 {
                if matrix[i][j] != matrix[i + 1][j + 1] {
                    return false;
                }
            }
        }
        
        true
    }
}
