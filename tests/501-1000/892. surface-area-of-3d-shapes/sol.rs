impl Solution {
    pub fn surface_area(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        let mut area = 0;
        for i in 0..n {
            for j in 0..n {
                if grid[i][j] > 0 {
                    area += grid[i][j] * 6;
                    area -= (grid[i][j] - 1) * 2;
                    if i + 1 < n {
                        area -= 2 * grid[i][j].min(grid[i + 1][j]);
                    }
                    if j + 1 < n {
                        area -= 2 * grid[i][j].min(grid[i][j + 1]);
                    }
                }
            }
        }
        area
    }
}
