impl Solution {
    pub fn max_increase_keeping_skyline(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        let row_max: Vec<i32> = grid.iter().map(|row| *row.iter().max().unwrap()).collect();
        let mut col_max = vec![0; n];
        for c in 0..n {
            let mut max_val = 0;
            for r in 0..n {
                max_val = max_val.max(grid[r][c]);
            }
            col_max[c] = max_val;
        }
        let mut gain = 0;
        for r in 0..n {
            for c in 0..n {
                gain += row_max[r].min(col_max[c]) - grid[r][c];
            }
        }
        gain
    }
}
