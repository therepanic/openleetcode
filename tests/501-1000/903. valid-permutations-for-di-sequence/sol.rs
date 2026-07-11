impl Solution {
    pub fn num_perms_di_sequence(s: String) -> i32 {
        let n = s.len();
        let MOD: i32 = 1_000_000_007;
        let mut dp = vec![1];
        let s_bytes = s.as_bytes();
        for i in 1..=n {
            let mut prefix = vec![0; i + 1];
            prefix[0] = dp[0];
            for j in 1..i {
                prefix[j] = (prefix[j-1] + dp[j]) % MOD;
            }
            prefix[i] = prefix[i-1] % MOD;
            let mut ndp = vec![0; i + 1];
            if s_bytes[i-1] == b'I' {
                for j in 0..=i {
                    ndp[j] = if j > 0 { prefix[j-1] % MOD } else { 0 };
                }
            } else {
                for j in 0..=i {
                    let sub = if j > 0 { prefix[j-1] } else { 0 };
                    ndp[j] = (prefix[i-1] - sub) % MOD;
                    if ndp[j] < 0 {
                        ndp[j] += MOD;
                    }
                }
            }
            dp = ndp;
        }
        dp.iter().fold(0, |acc, &v| (acc + v) % MOD)
    }
}
