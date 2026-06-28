impl Solution {
    pub fn find_paths(m: i32, n: i32, max_move: i32, start_row: i32, start_column: i32) -> i32 {
        const MOD: i32 = 1000000007;
        let m = m as usize;
        let n = n as usize;
        let max_move = max_move as usize;
        let mut dp = vec![vec![vec![0; n]; m]; max_move + 1];
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)];

        for mv in 1..=max_move {
            for i in 0..m {
                for j in 0..n {
                    for &(dx, dy) in &directions {
                        let x = i as i32 + dx;
                        let y = j as i32 + dy;
                        if x < 0 || x >= m as i32 || y < 0 || y >= n as i32 {
                            dp[mv][i][j] = (dp[mv][i][j] + 1) % MOD;
                        } else {
                            dp[mv][i][j] = (dp[mv][i][j] + dp[mv - 1][x as usize][y as usize]) % MOD;
                        }
                    }
                }
            }
        }

        dp[max_move][start_row as usize][start_column as usize]
    }
}
