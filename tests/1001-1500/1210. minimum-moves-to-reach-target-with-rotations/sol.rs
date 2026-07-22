impl Solution {
    pub fn minimum_moves(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        let target = (n - 1, n - 2, 0);
        
        let mut queue = std::collections::VecDeque::new();
        queue.push_back(((0, 0, 0), 0));
        
        let mut visited = vec![vec![[false; 2]; n]; n];
        visited[0][0][0] = true;
        
        while let Some(((r, c, o), dist)) = queue.pop_front() {
            if (r, c, o) == target {
                return dist;
            }
            
            if o == 0 {
                if c + 2 < n && grid[r][c + 2] == 0 {
                    if !visited[r][c + 1][0] {
                        visited[r][c + 1][0] = true;
                        queue.push_back(((r, c + 1, 0), dist + 1));
                    }
                }
                if r + 1 < n && grid[r + 1][c] == 0 && grid[r + 1][c + 1] == 0 {
                    if !visited[r + 1][c][0] {
                        visited[r + 1][c][0] = true;
                        queue.push_back(((r + 1, c, 0), dist + 1));
                    }
                }
            } else {
                if c + 1 < n && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0 {
                    if !visited[r][c + 1][1] {
                        visited[r][c + 1][1] = true;
                        queue.push_back(((r, c + 1, 1), dist + 1));
                    }
                }
                if r + 2 < n && grid[r + 2][c] == 0 {
                    if !visited[r + 1][c][1] {
                        visited[r + 1][c][1] = true;
                        queue.push_back(((r + 1, c, 1), dist + 1));
                    }
                }
            }
            
            if r + 1 < n && c + 1 < n &&
                grid[r + 1][c] == 0 && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0 {
                let new_o = 1 - o;
                if !visited[r][c][new_o] {
                    visited[r][c][new_o] = true;
                    queue.push_back(((r, c, new_o), dist + 1));
                }
            }
        }
        
        -1
    }
}
