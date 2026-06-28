impl Solution {
    pub fn k_inverse_pairs(n: i32, k: i32) -> i32 {
        const MOD: i64 = 1000000007;
        let n = n as usize;
        let k = k as usize;
        let mut dp = vec![vec![0i64; k + 1]; n + 1];

        for i in 1..=n {
            for j in 0..=k {
                if j == 0 {
                    dp[i][j] = 1;
                } else {
                    let mut val = dp[i - 1][j];
                    if j >= i {
                        val = (val - dp[i - 1][j - i] + MOD) % MOD;
                    }
                    dp[i][j] = (dp[i][j - 1] + val) % MOD;
                }
            }
        }

        let mut result = dp[n][k];
        if k > 0 {
            result = (result - dp[n][k - 1] + MOD) % MOD;
        }
        result as i32
    }
}
