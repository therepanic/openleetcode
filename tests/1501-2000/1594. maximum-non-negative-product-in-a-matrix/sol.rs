impl Solution {
    pub fn max_product_path(grid: Vec<Vec<i32>>) -> i32 {
        let r = grid.len();
        let c = grid[0].len();
        let MOD = 1_000_000_007i64;
        let mut dp = vec![vec![vec![0i64; 2]; c]; r];
        
        let mut p = grid[0][0] as i64;
        dp[0][0][0] = p;
        dp[0][0][1] = p;
        for j in 1..c {
            p *= grid[0][j] as i64;
            dp[0][j][0] = p;
            dp[0][j][1] = p;
        }
        
        p = grid[0][0] as i64;
        for i in 1..r {
            p *= grid[i][0] as i64;
            dp[i][0][0] = p;
            dp[i][0][1] = p;
            for j in 1..c {
                let x = grid[i][j] as i64;
                let vals = [x * dp[i][j-1][0], x * dp[i][j-1][1], x * dp[i-1][j][0], x * dp[i-1][j][1]];
                let mn = *vals.iter().min().unwrap();
                let mx = *vals.iter().max().unwrap();
                dp[i][j][0] = mn;
                dp[i][j][1] = mx;
            }
        }
        
        let ans = dp[r-1][c-1][1];
        if ans < 0 { return -1; }
        (ans % MOD) as i32
    }
}
