impl Solution {
    pub fn nearest_exit(maze: Vec<Vec<char>>, entrance: Vec<i32>) -> i32 {
        let n = maze.len() as i32;
        let m = maze[0].len() as i32;
        let mut visited = vec![vec![false; m as usize]; n as usize];
        let mut q = std::collections::VecDeque::new();
        q.push_back((entrance[0], entrance[1], 0));
        visited[entrance[0] as usize][entrance[1] as usize] = true;
        let dirs = [(-1,0),(1,0),(0,-1),(0,1)];
        
        while let Some((r, c, dist)) = q.pop_front() {
            for (dr, dc) in dirs.iter() {
                let nr = r + dr;
                let nc = c + dc;
                if nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr as usize][nc as usize] && maze[nr as usize][nc as usize] == '.' {
                    visited[nr as usize][nc as usize] = true;
                    if nr == 0 || nc == 0 || nr == n-1 || nc == m-1 {
                        return dist + 1;
                    }
                    q.push_back((nr, nc, dist+1));
                }
            }
        }
        -1
    }
}
