impl Solution {
    pub fn knight_probability(n: i32, k: i32, row: i32, column: i32) -> f64 {
        let n = n as usize;
        let k = k as usize;
        let row = row as usize;
        let column = column as usize;
        
        if k == 0 {
            return 1.0;
        }
        
        let moves = [(1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1), (-2, 1), (-1, 2)];
        
        let mut dp = vec![vec![0.0f64; n]; n];
        dp[row][column] = 1.0;
        
        for _ in 0..k {
            let mut next_dp = vec![vec![0.0f64; n]; n];
            for r in 0..n {
                for c in 0..n {
                    if dp[r][c] == 0.0 {
                        continue;
                    }
                    for (dr, dc) in moves.iter() {
                        let nr = r as isize + dr;
                        let nc = c as isize + dc;
                        if nr >= 0 && nr < n as isize && nc >= 0 && nc < n as isize {
                            let nr = nr as usize;
                            let nc = nc as usize;
                            next_dp[nr][nc] += dp[r][c] / 8.0;
                        }
                    }
                }
            }
            dp = next_dp;
        }
        
        let mut total = 0.0;
        for r in 0..n {
            for c in 0..n {
                total += dp[r][c];
            }
        }
        total
    }
}
