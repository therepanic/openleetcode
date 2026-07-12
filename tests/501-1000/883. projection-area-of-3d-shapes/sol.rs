impl Solution {
    pub fn projection_area(grid: Vec<Vec<i32>>) -> i32 {
        let mut xy_area = 0;
        let mut yz_area = 0;
        let mut zx_area = 0;
        let rows = grid.len();
        let cols = grid[0].len();
        for i in 0..rows {
            let mut max_row = 0;
            for j in 0..cols {
                if grid[i][j] > 0 {
                    xy_area += 1;
                }
                if grid[i][j] > max_row {
                    max_row = grid[i][j];
                }
            }
            yz_area += max_row;
        }
        for j in 0..cols {
            let mut max_col = 0;
            for i in 0..rows {
                if grid[i][j] > max_col {
                    max_col = grid[i][j];
                }
            }
            zx_area += max_col;
        }
        xy_area + yz_area + zx_area
    }
}
