impl Solution {
    pub fn shortest_path_binary_matrix(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        
        if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 {
            return -1;
        }
        
        if n == 1 {
            return 1;
        }
        
        let mut dist = vec![vec![i32::MAX; n]; n];
        dist[0][0] = 1;
        
        let mut q = std::collections::VecDeque::new();
        q.push_back((0usize, 0usize, 1i32));
        
        let directions = [
            (-1, 0), (-1, -1), (0, 1), (-1, 1),
            (1, 0), (1, -1), (0, -1), (1, 1)
        ];
        
        while let Some((r, c, dis)) = q.pop_front() {
            for (dr, dc) in &directions {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                
                if nr >= 0 && nr < n as i32 && nc >= 0 && nc < n as i32 {
                    let nr = nr as usize;
                    let nc = nc as usize;
                    
                    if grid[nr][nc] == 0 && dis + 1 < dist[nr][nc] {
                        dist[nr][nc] = dis + 1;
                        
                        if nr == n - 1 && nc == n - 1 {
                            return dis + 1;
                        }
                        
                        q.push_back((nr, nc, dis + 1));
                    }
                }
            }
        }
        
        -1
    }
}
