impl Solution {
    pub fn ways(pizza: Vec<String>, k: i32) -> i32 {
        let m = pizza.len();
        let n = pizza[0].len();
        let k = k as usize;
        let MOD: i32 = 1_000_000_007;
        let mut pre_sum = vec![vec![0i32; n + 1]; m + 1];
        let chars: Vec<Vec<char>> = pizza.iter().map(|s| s.chars().collect()).collect();

        for r in (0..m).rev() {
            for c in (0..n).rev() {
                pre_sum[r][c] = pre_sum[r][c + 1] + pre_sum[r + 1][c] - pre_sum[r + 1][c + 1] + if chars[r][c] == 'A' { 1 } else { 0 };
            }
        }

        let mut dp = vec![vec![vec![0i32; n]; m]; k];

        for r in 0..m {
            for c in 0..n {
                dp[0][r][c] = if pre_sum[r][c] > 0 { 1 } else { 0 };
            }
        }

        for cuts in 1..k {
            for r in 0..m {
                for c in 0..n {
                    if pre_sum[r][c] == 0 {
                        continue;
                    }
                    let mut ans = 0;
                    for nr in r + 1..m {
                        if pre_sum[r][c] - pre_sum[nr][c] > 0 {
                            ans = (ans + dp[cuts - 1][nr][c]) % MOD;
                        }
                    }
                    for nc in c + 1..n {
                        if pre_sum[r][c] - pre_sum[r][nc] > 0 {
                            ans = (ans + dp[cuts - 1][r][nc]) % MOD;
                        }
                    }
                    dp[cuts][r][c] = ans;
                }
            }
        }

        dp[k - 1][0][0]
    }
}
