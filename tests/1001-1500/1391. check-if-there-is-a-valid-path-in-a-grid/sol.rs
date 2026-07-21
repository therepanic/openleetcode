impl Solution {
    pub fn has_valid_path(grid: Vec<Vec<i32>>) -> bool {
        use std::collections::VecDeque;
        
        let m = grid.len();
        let n = grid[0].len();
        
        let dir: std::collections::HashMap<i32, Vec<(i32, i32)>> = [
            (1, vec![(0, -1), (0, 1)]),
            (2, vec![(-1, 0), (1, 0)]),
            (3, vec![(0, -1), (1, 0)]),
            (4, vec![(0, 1), (1, 0)]),
            (5, vec![(0, -1), (-1, 0)]),
            (6, vec![(0, 1), (-1, 0)]),
        ].iter().cloned().collect();
        
        let mut vis = vec![vec![false; n]; m];
        let mut q = VecDeque::new();
        q.push_back((0, 0));
        vis[0][0] = true;
        
        while let Some((r, c)) = q.pop_front() {
            if r == m - 1 && c == n - 1 {
                return true;
            }
            
            if let Some(dirs) = dir.get(&grid[r][c]) {
                for &(dr, dc) in dirs {
                    let nr = r as i32 + dr;
                    let nc = c as i32 + dc;
                    
                    if nr < 0 || nc < 0 || nr >= m as i32 || nc >= n as i32 {
                        continue;
                    }
                    
                    let nr = nr as usize;
                    let nc = nc as usize;
                    
                    if vis[nr][nc] {
                        continue;
                    }
                    
                    if let Some(bdirs) = dir.get(&grid[nr][nc]) {
                        for &(bdr, bdc) in bdirs {
                            if nr as i32 + bdr == r as i32 && nc as i32 + bdc == c as i32 {
                                vis[nr][nc] = true;
                                q.push_back((nr, nc));
                            }
                        }
                    }
                }
            }
        }
        
        false
    }
}
