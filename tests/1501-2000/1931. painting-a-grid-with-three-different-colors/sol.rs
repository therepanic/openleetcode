impl Solution {
    pub fn color_the_grid(m: i32, n: i32) -> i32 {
        let modulus: i64 = 1000000007;
        let m = m as usize;
        let n = n as usize;
        let mut total = 1;
        for _ in 0..m {
            total *= 3;
        }
        let mut dp = vec![vec![0i64; total]; n+1];
        let mut row_valid = vec![vec![0i32; total]; total];
        let mut good: Vec<usize> = Vec::new();
        let mut pattern = vec![vec![0i32; m]; total];
        for i in 0..total {
            let mut val = i;
            let mut valid = 1;
            for k in 0..m {
                pattern[i][k] = (val % 3) as i32;
                val /= 3;
            }
            for k in 1..m {
                if pattern[i][k] == pattern[i][k-1] {
                    valid = 0;
                    break;
                }
            }
            if valid == 1 {
                good.push(i);
            }
        }
        for &i in &good {
            dp[1][i] = 1;
        }
        for &i in &good {
            for &j in &good {
                row_valid[i][j] = 1;
                for k in 0..m {
                    if pattern[i][k] == pattern[j][k] {
                        row_valid[i][j] = 0;
                        break;
                    }
                }
            }
        }
        for col in 2..=n {
            for &i in &good {
                let mut total_ways: i64 = 0;
                for &j in &good {
                    if row_valid[i][j] == 1 {
                        total_ways += dp[col-1][j];
                    }
                }
                dp[col][i] = total_ways % modulus;
            }
        }
        let mut ans: i64 = 0;
        for &i in &good {
            ans += dp[n][i];
        }
        (ans % modulus) as i32
    }
}
