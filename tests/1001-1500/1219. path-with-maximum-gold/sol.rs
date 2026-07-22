impl Solution {
    pub fn get_maximum_gold(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        let m = grid[0].len();
        
        let mut visited = vec![vec![false; m]; n];
        let directions = vec![(-1, 0), (0, 1), (1, 0), (0, -1)];
        
        fn dfs(grid: &Vec<Vec<i32>>, visited: &mut Vec<Vec<bool>>, r: usize, c: usize, n: usize, m: usize, directions: &Vec<(i32, i32)>) -> i32 {
            let mut total = grid[r][c];
            visited[r][c] = true;
            
            let mut curr = 0;
            for &(dr, dc) in directions {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                if nr >= 0 && nr < n as i32 && nc >= 0 && nc < m as i32 {
                    let nr = nr as usize;
                    let nc = nc as usize;
                    if grid[nr][nc] != 0 && !visited[nr][nc] {
                        let a = dfs(grid, visited, nr, nc, n, m, directions);
                        curr = curr.max(a);
                    }
                }
            }
            total += curr;
            visited[r][c] = false;
            total
        }
        
        let mut ans = 0;
        for i in 0..n {
            for j in 0..m {
                if !visited[i][j] && grid[i][j] != 0 {
                    ans = ans.max(dfs(&grid, &mut visited, i, j, n, m, &directions));
                }
            }
        }
        ans
    }
}
