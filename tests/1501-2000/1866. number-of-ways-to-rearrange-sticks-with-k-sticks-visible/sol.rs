impl Solution {
    pub fn rearrange_sticks(n: i32, k: i32) -> i32 {
        let mod_val = 1000000007i64;
        let n = n as usize;
        let k = k as usize;
        let mut dp = vec![0i64; k + 1];
        dp[0] = 1;
        for length in 1..=n {
            let mut nxt = vec![0i64; k + 1];
            for visible in 1..=length.min(k) {
                nxt[visible] = (dp[visible - 1] + (length as i64 - 1) * dp[visible]) % mod_val;
            }
            dp = nxt;
        }
        dp[k] as i32
    }
}
