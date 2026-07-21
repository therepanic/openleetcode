impl Solution {
    pub fn lucky_numbers(matrix: Vec<Vec<i32>>) -> Vec<i32> {
        let rows = matrix.len();
        let cols = matrix[0].len();
        let mut ans = Vec::new();
        for i in 0..rows {
            for j in 0..cols {
                let mut ele1 = i32::MAX;
                for k in 0..cols {
                    if matrix[i][k] < ele1 {
                        ele1 = matrix[i][k];
                    }
                }
                let mut ele2 = i32::MIN;
                for k in 0..rows {
                    if matrix[k][j] > ele2 {
                        ele2 = matrix[k][j];
                    }
                }
                if ele1 == matrix[i][j] && ele2 == matrix[i][j] {
                    ans.push(matrix[i][j]);
                }
            }
        }
        ans
    }
}
