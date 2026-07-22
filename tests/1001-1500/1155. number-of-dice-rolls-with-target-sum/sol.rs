impl Solution {
    pub fn num_rolls_to_target(n: i32, k: i32, target: i32) -> i32 {
        const MOD: i32 = 1_000_000_007;
        let n = n as usize;
        let k = k as usize;
        let target = target as usize;
        
        let mut dp = vec![0; target + 1];
        dp[0] = 1;
        
        for _ in 0..n {
            let mut new_dp = vec![0; target + 1];
            let mut window_sum = 0;
            
            for s in 1..=target {
                window_sum = (window_sum + dp[s - 1]) % MOD;
                
                if s > k {
                    window_sum = (window_sum - dp[s - k - 1] + MOD) % MOD;
                }
                
                new_dp[s] = window_sum;
            }
            
            dp = new_dp;
        }
        
        dp[target]
    }
}
