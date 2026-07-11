impl Solution {
    pub fn unique_paths_iii(grid: Vec<Vec<i32>>) -> i32 {
        let m = grid.len();
        let n = grid[0].len();
        let mut grid = grid;
        let mut sx = 0;
        let mut sy = 0;
        let mut count = 0;
        for i in 0..m {
            for j in 0..n {
                if grid[i][j] == 0 {
                    count += 1;
                }
                if grid[i][j] == 1 {
                    sx = i;
                    sy = j;
                }
            }
        }
        
        fn backtrack(grid: &mut Vec<Vec<i32>>, m: usize, n: usize, i: usize, j: usize, count: i32) -> i32 {
            let mut result = 0;
            let dirs: [(isize, isize); 4] = [(-1, 0), (1, 0), (0, -1), (0, 1)];
            for (di, dj) in dirs.iter() {
                let x = i as isize + di;
                let y = j as isize + dj;
                if x < 0 || x >= m as isize || y < 0 || y >= n as isize {
                    continue;
                }
                let x = x as usize;
                let y = y as usize;
                if grid[x][y] == 2 {
                    if count == 0 {
                        result += 1;
                    }
                } else if grid[x][y] == 0 {
                    grid[x][y] = -1;
                    result += backtrack(grid, m, n, x, y, count - 1);
                    grid[x][y] = 0;
                }
            }
            result
        }
        
        backtrack(&mut grid, m, n, sx, sy, count)
    }
}
