impl Solution {
    pub fn shortest_bridge(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)];
        let mut visited = vec![vec![false; n]; n];
        let mut q = std::collections::VecDeque::new();
        
        fn dfs(r: usize, c: usize, grid: &Vec<Vec<i32>>, visited: &mut Vec<Vec<bool>>, 
               directions: &[(i32, i32)], q: &mut std::collections::VecDeque<(usize, usize, i32)>) {
            visited[r][c] = true;
            for &(dr, dc) in directions {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                if nr >= 0 && nr < grid.len() as i32 && nc >= 0 && nc < grid.len() as i32 {
                    let nr = nr as usize;
                    let nc = nc as usize;
                    if !visited[nr][nc] {
                        if grid[nr][nc] == 0 {
                            visited[nr][nc] = true;
                            q.push_back((nr, nc, 1));
                        } else {
                            dfs(nr, nc, grid, visited, directions, q);
                        }
                    }
                }
            }
        }
        
        let mut found = false;
        for i in 0..n {
            for j in 0..n {
                if grid[i][j] == 1 {
                    dfs(i, j, &grid, &mut visited, &directions, &mut q);
                    found = true;
                    break;
                }
            }
            if found { break; }
        }
        
        while let Some((r, c, dist)) = q.pop_front() {
            for &(dr, dc) in &directions {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                if nr >= 0 && nr < n as i32 && nc >= 0 && nc < n as i32 {
                    let nr = nr as usize;
                    let nc = nc as usize;
                    if !visited[nr][nc] {
                        if grid[nr][nc] == 1 {
                            return dist;
                        }
                        visited[nr][nc] = true;
                        q.push_back((nr, nc, dist + 1));
                    }
                }
            }
        }
        0
    }
}
