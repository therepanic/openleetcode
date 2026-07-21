impl Solution {
    pub fn min_insertions(s: String) -> i32 {
        let n = s.len();
        let s2: String = s.chars().rev().collect();
        let s_bytes = s.as_bytes();
        let s2_bytes = s2.as_bytes();
        let mut dp = vec![vec![0; n + 1]; n + 1];
        for i in 1..=n {
            for j in 1..=n {
                if s_bytes[i - 1] == s2_bytes[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1];
                } else {
                    dp[i][j] = dp[i - 1][j].max(dp[i][j - 1]);
                }
            }
        }
        (n - dp[n][n]) as i32
    }
}
