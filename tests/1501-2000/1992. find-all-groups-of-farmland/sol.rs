impl Solution {
    pub fn find_farmland(land: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let n = land.len();
        let m = land[0].len();
        let mut visited = vec![vec![false; m]; n];
        let directions = [[-1,0],[0,1],[1,0],[0,-1]];
        
        let mut maxr = vec![0];
        let mut maxc = vec![0];
        
        fn dfs(land: &Vec<Vec<i32>>, visited: &mut Vec<Vec<bool>>, directions: &[[i32;2]], r: usize, c: usize, maxr: &mut Vec<i32>, maxc: &mut Vec<i32>) {
            visited[r][c] = true;
            maxr[0] = maxr[0].max(r as i32);
            maxc[0] = maxc[0].max(c as i32);
            for d in directions {
                let nr = r as i32 + d[0];
                let nc = c as i32 + d[1];
                if nr >= 0 && nr < land.len() as i32 && nc >= 0 && nc < land[0].len() as i32 {
                    let nr = nr as usize;
                    let nc = nc as usize;
                    if !visited[nr][nc] && land[nr][nc] == 1 {
                        dfs(land, visited, directions, nr, nc, maxr, maxc);
                    }
                }
            }
        }
        
        let mut res: Vec<Vec<i32>> = Vec::new();
        for i in 0..n {
            for j in 0..m {
                if land[i][j] == 1 && !visited[i][j] {
                    maxr[0] = i as i32;
                    maxc[0] = j as i32;
                    dfs(&land, &mut visited, &directions, i, j, &mut maxr, &mut maxc);
                    res.push(vec![i as i32, j as i32, maxr[0], maxc[0]]);
                }
            }
        }
        res
    }
}
