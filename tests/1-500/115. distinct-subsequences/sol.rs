
impl Solution {
    pub fn num_distinct(s: String, t: String) -> i32 {
        let t_bytes = t.as_bytes();
        let mut dp = vec![0_i64; t_bytes.len() + 1];
        dp[0] = 1;
        for &ch in s.as_bytes() {
            for j in (0..t_bytes.len()).rev() {
                if ch == t_bytes[j] {
                    dp[j + 1] += dp[j];
                }
            }
        }
        dp[t_bytes.len()] as i32
    }
}
