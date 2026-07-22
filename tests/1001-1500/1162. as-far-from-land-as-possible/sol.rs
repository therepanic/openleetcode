impl Solution {
    pub fn max_distance(grid: Vec<Vec<i32>>) -> i32 {
        if grid.is_empty() || grid[0].is_empty() {
            return -1;
        }
        
        let n = grid.len();
        let mut grid = grid;
        let mut frontier: Vec<(usize, usize)> = Vec::new();
        
        for r in 0..n {
            for c in 0..n {
                if grid[r][c] == 1 {
                    frontier.push((r, c));
                }
            }
        }
        
        if frontier.is_empty() || frontier.len() == n * n {
            return -1;
        }
        
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)];
        let mut distance = -1;
        
        while !frontier.is_empty() {
            let mut next_frontier: Vec<(usize, usize)> = Vec::new();
            distance += 1;
            
            for (r, c) in &frontier {
                for (dr, dc) in &directions {
                    let nr = *r as i32 + dr;
                    let nc = *c as i32 + dc;
                    
                    if nr >= 0 && nr < n as i32 && nc >= 0 && nc < n as i32 {
                        let nr = nr as usize;
                        let nc = nc as usize;
                        
                        if grid[nr][nc] == 0 {
                            grid[nr][nc] = 1;
                            next_frontier.push((nr, nc));
                        }
                    }
                }
            }
            
            frontier = next_frontier;
        }
        
        distance
    }
}
