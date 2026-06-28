impl Solution {
    pub fn max_area_of_island(grid: Vec<Vec<i32>>) -> i32 {
        let rows = grid.len();
        let cols = grid[0].len();
        let mut visited = vec![vec![false; cols]; rows];
        let mut max_island = 0;
        
        fn dfs(grid: &Vec<Vec<i32>>, visited: &mut Vec<Vec<bool>>, r: i32, c: i32, rows: i32, cols: i32) -> i32 {
            if r < 0 || r >= rows || c < 0 || c >= cols || visited[r as usize][c as usize] || grid[r as usize][c as usize] == 0 {
                return 0;
            }
            
            visited[r as usize][c as usize] = true;
            
            return 1 + dfs(grid, visited, r+1, c, rows, cols) + dfs(grid, visited, r-1, c, rows, cols) + dfs(grid, visited, r, c+1, rows, cols) + dfs(grid, visited, r, c-1, rows, cols);
        }
        
        for r in 0..rows {
            for c in 0..cols {
                if grid[r][c] == 1 && !visited[r][c] {
                    max_island = max_island.max(dfs(&grid, &mut visited, r as i32, c as i32, rows as i32, cols as i32));
                }
            }
        }
        
        max_island
    }
}
