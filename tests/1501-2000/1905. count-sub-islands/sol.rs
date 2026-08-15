impl Solution {
    pub fn count_sub_islands(grid1: Vec<Vec<i32>>, grid2: Vec<Vec<i32>>) -> i32 {
        let m = grid1.len();
        let n = grid1[0].len();
        let mut grid2 = grid2;
        let mut valid = false;
        
        fn dfs(grid1: &Vec<Vec<i32>>, grid2: &mut Vec<Vec<i32>>, i: usize, j: usize, m: usize, n: usize, valid: &mut bool) {
            if i >= m || j >= n { return; }
            if grid2[i][j] == 0 { return; }
            if grid1[i][j] == 0 { *valid = false; }
            grid2[i][j] = 0;
            if i+1 < m { dfs(grid1, grid2, i+1, j, m, n, valid); }
            if i > 0 { dfs(grid1, grid2, i-1, j, m, n, valid); }
            if j+1 < n { dfs(grid1, grid2, i, j+1, m, n, valid); }
            if j > 0 { dfs(grid1, grid2, i, j-1, m, n, valid); }
        }
        
        let mut res = 0;
        for i in 0..m {
            for j in 0..n {
                if grid2[i][j] == 1 {
                    valid = true;
                    dfs(&grid1, &mut grid2, i, j, m, n, &mut valid);
                    if valid { res += 1; }
                }
            }
        }
        res
    }
}
