impl Solution {
    pub fn minimum_delete_sum(s1: String, s2: String) -> i32 {
        let n = s1.len();
        let m = s2.len();
        let s1_bytes = s1.as_bytes();
        let s2_bytes = s2.as_bytes();
        let mut dp = vec![vec![0; m + 1]; n + 1];
        for i in 0..n {
            for j in 0..m {
                if s1_bytes[i] == s2_bytes[j] {
                    dp[i + 1][j + 1] = dp[i][j] + s1_bytes[i] as i32;
                } else {
                    dp[i + 1][j + 1] = dp[i][j + 1].max(dp[i + 1][j]);
                }
            }
        }
        let total_ascii: i32 = s1_bytes.iter().map(|&b| b as i32).sum::<i32>()
            + s2_bytes.iter().map(|&b| b as i32).sum::<i32>();
        total_ascii - 2 * dp[n][m]
    }
}
