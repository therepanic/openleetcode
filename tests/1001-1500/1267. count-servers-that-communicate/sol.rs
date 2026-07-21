impl Solution {
    pub fn count_servers(grid: Vec<Vec<i32>>) -> i32 {
        let m = grid.len();
        let n = grid[0].len();
        let mut row_counts = vec![0; m];
        let mut col_counts = vec![0; n];
        for i in 0..m {
            for j in 0..n {
                if grid[i][j] == 1 {
                    row_counts[i] += 1;
                    col_counts[j] += 1;
                }
            }
        }
        let mut result = 0;
        for i in 0..m {
            for j in 0..n {
                if grid[i][j] == 1 && (row_counts[i] > 1 || col_counts[j] > 1) {
                    result += 1;
                }
            }
        }
        result
    }
}
