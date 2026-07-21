impl Solution {
    pub fn closed_island(grid: Vec<Vec<i32>>) -> i32 {
        let mut grid = grid;
        let m = grid.len();
        let n = grid[0].len();
        let mut res = 0;
        for i in 0..m {
            for j in 0..n {
                if grid[i][j] == 1 {
                    continue;
                }
                let mut stack = vec![(i, j)];
                grid[i][j] = 1;
                let mut closed = true;
                while let Some((r, c)) = stack.pop() {
                    if r == 0 || c == 0 || r == m - 1 || c == n - 1 {
                        closed = false;
                    }
                    let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
                    for (dr, dc) in &dirs {
                        let nr = r as i32 + dr;
                        let nc = c as i32 + dc;
                        if nr >= 0 && nr < m as i32 && nc >= 0 && nc < n as i32 {
                            let nr = nr as usize;
                            let nc = nc as usize;
                            if grid[nr][nc] == 0 {
                                grid[nr][nc] = 1;
                                stack.push((nr, nc));
                            }
                        }
                    }
                }
                if closed {
                    res += 1;
                }
            }
        }
        res
    }
}
