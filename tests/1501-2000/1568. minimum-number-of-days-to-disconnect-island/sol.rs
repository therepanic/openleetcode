impl Solution {
    pub fn min_days(grid: Vec<Vec<i32>>) -> i32 {
        let mut grid = grid;
        let dirs = [(-1,0),(1,0),(0,-1),(0,1)];
        
        fn count_islands(grid: &Vec<Vec<i32>>, dirs: &[(i32,i32)]) -> i32 {
            let rows = grid.len();
            let cols = grid[0].len();
            let mut seen = vec![vec![false; cols]; rows];
            let mut islands = 0;
            
            for i in 0..rows {
                for j in 0..cols {
                    if grid[i][j] == 1 && !seen[i][j] {
                        islands += 1;
                        let mut stack = vec![(i as i32, j as i32)];
                        seen[i][j] = true;
                        while let Some((x,y)) = stack.pop() {
                            for &(dx,dy) in dirs {
                                let nx = x + dx;
                                let ny = y + dy;
                                if nx >= 0 && nx < rows as i32 && ny >= 0 && ny < cols as i32 && grid[nx as usize][ny as usize] == 1 && !seen[nx as usize][ny as usize] {
                                    seen[nx as usize][ny as usize] = true;
                                    stack.push((nx,ny));
                                }
                            }
                        }
                    }
                }
            }
            islands
        }
        
        if count_islands(&grid, &dirs) != 1 {
            return 0;
        }
        
        for i in 0..grid.len() {
            for j in 0..grid[0].len() {
                if grid[i][j] == 1 {
                    grid[i][j] = 0;
                    if count_islands(&grid, &dirs) != 1 {
                        return 1;
                    }
                    grid[i][j] = 1;
                }
            }
        }
        2
    }
}
