impl Solution {
    pub fn matrix_score(grid: Vec<Vec<i32>>) -> i32 {
        let mut grid = grid;
        let rows = grid.len();
        let cols = grid[0].len();
        for row in grid.iter_mut() {
            if row[0] == 0 {
                for i in 0..cols {
                    row[i] ^= 1;
                }
            }
        }
        for j in 1..cols {
            let mut temp = 0;
            for i in 0..rows {
                temp += grid[i][j];
            }
            if 2 * temp < rows as i32 {
                for i in 0..rows {
                    grid[i][j] ^= 1;
                }
            }
        }
        let mut ans = 0;
        for row in &grid {
            let mut val = 0;
            for &bit in row {
                val = (val << 1) | bit;
            }
            ans += val;
        }
        ans
    }
}
