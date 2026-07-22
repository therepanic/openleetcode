impl Solution {
    pub fn num_ways(steps: i32, arr_len: i32) -> i32 {
        const MOD: i32 = 1_000_000_007;
        let max_pos = (steps / 2).min(arr_len - 1) as usize;
        let mut dp = vec![0; max_pos + 1];
        dp[0] = 1;
        for _ in 0..steps {
            let mut new_dp = vec![0; max_pos + 1];
            for pos in 0..=max_pos {
                if dp[pos] == 0 {
                    continue;
                }
                new_dp[pos] = (new_dp[pos] + dp[pos]) % MOD;
                if pos > 0 {
                    new_dp[pos - 1] = (new_dp[pos - 1] + dp[pos]) % MOD;
                }
                if pos < max_pos {
                    new_dp[pos + 1] = (new_dp[pos + 1] + dp[pos]) % MOD;
                }
            }
            dp = new_dp;
        }
        dp[0]
    }
}
