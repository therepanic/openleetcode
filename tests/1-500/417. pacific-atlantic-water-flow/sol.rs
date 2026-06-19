impl Solution {
    pub fn pacific_atlantic(heights: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        if heights.is_empty() {
            return vec![];
        }
        let m = heights.len();
        let n = heights[0].len();
        let directions = vec![(1,0), (-1,0), (0,1), (0,-1)];
        
        let mut pacific = vec![vec![false; n]; m];
        let mut atlantic = vec![vec![false; n]; m];
        
        fn dfs(i: usize, j: usize, visited: &mut Vec<Vec<bool>>, heights: &Vec<Vec<i32>>, directions: &Vec<(i32, i32)>) {
            visited[i][j] = true;
            let m = heights.len() as i32;
            let n = heights[0].len() as i32;
            for &(dx, dy) in directions {
                let x = i as i32 + dx;
                let y = j as i32 + dy;
                if x >= 0 && x < m && y >= 0 && y < n {
                    let x = x as usize;
                    let y = y as usize;
                    if !visited[x][y] && heights[x][y] >= heights[i][j] {
                        dfs(x, y, visited, heights, directions);
                    }
                }
            }
        }
        
        for j in 0..n { dfs(0, j, &mut pacific, &heights, &directions); }
        for i in 0..m { dfs(i, 0, &mut pacific, &heights, &directions); }
        for j in 0..n { dfs(m-1, j, &mut atlantic, &heights, &directions); }
        for i in 0..m { dfs(i, n-1, &mut atlantic, &heights, &directions); }
        
        let mut result = vec![];
        for i in 0..m {
            for j in 0..n {
                if pacific[i][j] && atlantic[i][j] {
                    result.push(vec![i as i32, j as i32]);
                }
            }
        }
        result
    }
}
