impl Solution {
    pub fn number_of_arrays(s: String, k: i32) -> i32 {
        let m: i32 = 1000000007;
        let n = s.len();
        let mut dp = vec![0i32; n + 1];
        dp[0] = 1;
        let width = k.to_string().len();
        let s_bytes = s.as_bytes();
        for i in 0..n {
            if s_bytes[i] == b'0' || dp[i] == 0 {
                continue;
            }
            let mut value: i64 = 0;
            let k_i64 = k as i64;
            for j in i..std::cmp::min(n, i + width) {
                value = value * 10 + (s_bytes[j] - b'0') as i64;
                if value > k_i64 {
                    break;
                }
                dp[j + 1] = (dp[j + 1] + dp[i]) % m;
            }
        }
        dp[n]
    }
}
