impl Solution {
    pub fn count_squares(matrix: Vec<Vec<i32>>) -> i32 {
        if matrix.is_empty() || matrix[0].is_empty() {
            return 0;
        }
        
        let mut matrix = matrix;
        let m = matrix.len();
        let n = matrix[0].len();
        let mut res = 0;
        
        for i in 0..m {
            for j in 0..n {
                if matrix[i][j] == 1 && i > 0 && j > 0 {
                    matrix[i][j] = std::cmp::min(
                        std::cmp::min(matrix[i-1][j], matrix[i][j-1]),
                        matrix[i-1][j-1]
                    ) + 1;
                }
                res += matrix[i][j];
            }
        }
        
        res
    }
}
