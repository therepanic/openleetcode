impl Solution {
    pub fn largest_island(grid: Vec<Vec<i32>>) -> i32 {
        let mut grid = grid;
        let r = grid.len();
        let c = grid[0].len();
        let dirs = [(1, 0), (0, 1), (-1, 0), (0, -1)];
        let mut island = 2;
        let mut a = std::collections::HashMap::new();
        
        fn dfs(grid: &mut Vec<Vec<i32>>, i: usize, j: usize, x: i32, r: usize, c: usize, dirs: &[(i32, i32)]) -> i32 {
            let mut tot = 1;
            grid[i][j] = x;
            for &(dx, dy) in dirs {
                let nx = i as i32 + dx;
                let ny = j as i32 + dy;
                if nx >= 0 && ny >= 0 {
                    let nx = nx as usize;
                    let ny = ny as usize;
                    if nx < r && ny < c && grid[nx][ny] == 1 {
                        tot += dfs(grid, nx, ny, x, r, c, dirs);
                    }
                }
            }
            tot
        }
        
        for i in 0..r {
            for j in 0..c {
                if grid[i][j] == 1 {
                    let val = dfs(&mut grid, i, j, island, r, c, &dirs);
                    a.insert(island, val);
                    island += 1;
                }
            }
        }
        
        let mut res = 0;
        for i in 0..r {
            for j in 0..c {
                if grid[i][j] == 0 {
                    let mut y = std::collections::HashSet::new();
                    for &(dx, dy) in &dirs {
                        let nx = i as i32 + dx;
                        let ny = j as i32 + dy;
                        if nx >= 0 && ny >= 0 {
                            let nx = nx as usize;
                            let ny = ny as usize;
                            if nx < r && ny < c && grid[nx][ny] != 0 {
                                y.insert(grid[nx][ny]);
                            }
                        }
                    }
                    let mut tot = 1;
                    for b in y {
                        if let Some(&v) = a.get(&b) {
                            tot += v;
                        }
                    }
                    res = res.max(tot);
                }
            }
        }
        
        res.max(*a.get(&2).unwrap_or(&0))
    }
}
