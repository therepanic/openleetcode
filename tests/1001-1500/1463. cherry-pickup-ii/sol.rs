impl Solution {
    pub fn cherry_pickup(grid: Vec<Vec<i32>>) -> i32 {
        let m = grid.len();
        let n = grid[0].len();
        let mut dp = vec![vec![vec![-1; n]; n]; m];
        dp[0][0][n-1] = grid[0][0] + grid[0][n-1];

        for i in 1..m {
            for j in 0..n {
                for k in j+1..n {
                    for x in -1..=1 {
                        for y in -1..=1 {
                            let nj = j as i32 + x;
                            let nk = k as i32 + y;
                            if nj >= 0 && nj < n as i32 && nk >= 0 && nk < n as i32 {
                                let prev = dp[i-1][nj as usize][nk as usize];
                                if prev != -1 {
                                    let mut add = grid[i][j];
                                    if j != k {
                                        add += grid[i][k];
                                    }
                                    dp[i][j][k] = dp[i][j][k].max(prev + add);
                                }
                            }
                        }
                    }
                }
            }
        }

        let mut ans = -1;
        for row in &dp[m-1] {
            for &v in row {
                ans = ans.max(v);
            }
        }
        if ans != -1 { ans } else { 0 }
    }
}
