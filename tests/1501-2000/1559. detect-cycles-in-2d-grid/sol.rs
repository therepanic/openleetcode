impl Solution {
    pub fn contains_cycle(grid: Vec<Vec<char>>) -> bool {
        let n = grid.len();
        let m = grid[0].len();
        let mut visited = vec![vec![false; m]; n];
        let directions = [(-1,0), (1,0), (0,-1), (0,1)];
        
        for i in 0..n {
            for j in 0..m {
                if !visited[i][j] {
                    if Self::bfs(i, j, &grid, &mut visited, &directions) {
                        return true;
                    }
                }
            }
        }
        false
    }
    
    fn bfs(start_i: usize, start_j: usize, grid: &Vec<Vec<char>>, visited: &mut Vec<Vec<bool>>, directions: &[(i32, i32)]) -> bool {
        let n = grid.len();
        let m = grid[0].len();
        let mut queue = vec![(start_i as i32, start_j as i32, -1i32, -1i32)];
        visited[start_i][start_j] = true;
        let mut head = 0;
        
        while head < queue.len() {
            let (x, y, px, py) = queue[head];
            head += 1;
            
            for &(dx, dy) in directions.iter() {
                let nx = x + dx;
                let ny = y + dy;
                if nx < 0 || ny < 0 || nx >= n as i32 || ny >= m as i32 { continue; }
                let nxu = nx as usize;
                let nyu = ny as usize;
                if grid[nxu][nyu] != grid[x as usize][y as usize] { continue; }
                if nx == px && ny == py { continue; }
                if visited[nxu][nyu] { return true; }
                visited[nxu][nyu] = true;
                queue.push((nx, ny, x, y));
            }
        }
        false
    }
}
