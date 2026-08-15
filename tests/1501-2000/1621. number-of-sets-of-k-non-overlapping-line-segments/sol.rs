impl Solution {
    pub fn number_of_sets(n: i32, k: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = n as usize;
        let k = k as usize;
        let mut dp_prev = vec![1i64; n];
        
        let mut prefix_prev = vec![0i64; n];
        prefix_prev[0] = dp_prev[0];
        for i in 1..n {
            prefix_prev[i] = (prefix_prev[i-1] + dp_prev[i]) % MOD;
        }
        
        for _ in 0..k {
            let mut dp_cur = vec![0i64; n];
            for i in 1..n {
                dp_cur[i] = (dp_cur[i-1] + prefix_prev[i-1]) % MOD;
            }
            dp_prev = dp_cur;
            prefix_prev[0] = dp_prev[0];
            for i in 1..n {
                prefix_prev[i] = (prefix_prev[i-1] + dp_prev[i]) % MOD;
            }
        }
        
        dp_prev[n-1] as i32
    }
}
