impl Solution {
    pub fn color_border(grid: Vec<Vec<i32>>, row: i32, col: i32, color: i32) -> Vec<Vec<i32>> {
        let mut grid = grid;
        let rows = grid.len();
        let cols = grid[0].len();
        let start_color = grid[row as usize][col as usize];
        
        if start_color == color {
            return grid;
        }
        
        let mut queue = std::collections::VecDeque::new();
        queue.push_back((row as usize, col as usize));
        let mut visited = vec![vec![false; cols]; rows];
        visited[row as usize][col as usize] = true;
        let mut borders = Vec::new();
        
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)];
        
        while let Some((r, c)) = queue.pop_front() {
            let mut is_border = false;
            
            for (dr, dc) in dirs.iter() {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                
                if nr < 0 || nr >= rows as i32 || nc < 0 || nc >= cols as i32 {
                    is_border = true;
                } else if grid[nr as usize][nc as usize] != start_color {
                    is_border = true;
                } else if !visited[nr as usize][nc as usize] {
                    visited[nr as usize][nc as usize] = true;
                    queue.push_back((nr as usize, nc as usize));
                }
            }
            
            if is_border {
                borders.push((r, c));
            }
        }
        
        for (r, c) in borders {
            grid[r][c] = color;
        }
        
        grid
    }
}
