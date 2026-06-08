impl Solution {
    pub fn is_match(s: String, p: String) -> bool {
        let s = s.as_bytes();
        let p = p.as_bytes();
        let m = s.len();
        let n = p.len();
        let mut dp = vec![vec![false; n + 1]; m + 1];
        dp[0][0] = true;

        for j in 1..=n {
            if p[j - 1] == b'*' {
                dp[0][j] = dp[0][j - 1];
            }
        }

        for i in 1..=m {
            for j in 1..=n {
                if p[j - 1] == b'?' || p[j - 1] == s[i - 1] {
                    dp[i][j] = dp[i - 1][j - 1];
                } else if p[j - 1] == b'*' {
                    dp[i][j] = dp[i][j - 1] || dp[i - 1][j];
                }
            }
        }

        dp[m][n]
    }
}
