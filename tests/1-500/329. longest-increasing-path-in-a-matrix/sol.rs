impl Solution {
    pub fn longest_increasing_path(matrix: Vec<Vec<i32>>) -> i32 {
        let row = matrix.len();
        let col = matrix[0].len();
        let mut dp = vec![vec![0; col]; row];
        
        fn graph(i: usize, j: usize, matrix: &Vec<Vec<i32>>, dp: &mut Vec<Vec<i32>>, row: usize, col: usize) -> i32 {
            if dp[i][j] != 0 {
                return dp[i][j];
            }
            
            let mut top = 0;
            let mut down = 0;
            let mut left = 0;
            let mut right = 0;
            
            if i > 0 && matrix[i-1][j] > matrix[i][j] {
                if dp[i-1][j] == 0 {
                    dp[i-1][j] = graph(i-1, j, matrix, dp, row, col);
                }
                top = dp[i-1][j];
            }
            
            if i + 1 < row && matrix[i+1][j] > matrix[i][j] {
                if dp[i+1][j] == 0 {
                    dp[i+1][j] = graph(i+1, j, matrix, dp, row, col);
                }
                down = dp[i+1][j];
            }
            
            if j > 0 && matrix[i][j-1] > matrix[i][j] {
                if dp[i][j-1] == 0 {
                    dp[i][j-1] = graph(i, j-1, matrix, dp, row, col);
                }
                left = dp[i][j-1];
            }
            
            if j + 1 < col && matrix[i][j+1] > matrix[i][j] {
                if dp[i][j+1] == 0 {
                    dp[i][j+1] = graph(i, j+1, matrix, dp, row, col);
                }
                right = dp[i][j+1];
            }
            
            dp[i][j] = 1 + top.max(down).max(left).max(right);
            dp[i][j]
        }
        
        let mut maxi = 0;
        for i in 0..row {
            for j in 0..col {
                let num = graph(i, j, &matrix, &mut dp, row, col);
                maxi = maxi.max(num);
            }
        }
        
        maxi
    }
}
