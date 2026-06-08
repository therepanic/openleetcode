impl Solution {
    pub fn is_interleave(s1: String, s2: String, s3: String) -> bool {
        let m = s1.len();
        let n = s2.len();
        if m + n != s3.len() {
            return false;
        }

        let b1 = s1.as_bytes();
        let b2 = s2.as_bytes();
        let b3 = s3.as_bytes();
        let mut dp = vec![false; n + 1];
        dp[0] = true;

        for j in 1..=n {
            dp[j] = dp[j - 1] && b2[j - 1] == b3[j - 1];
        }

        for i in 1..=m {
            dp[0] = dp[0] && b1[i - 1] == b3[i - 1];
            for j in 1..=n {
                dp[j] = (dp[j] && b1[i - 1] == b3[i + j - 1])
                    || (dp[j - 1] && b2[j - 1] == b3[i + j - 1]);
            }
        }

        dp[n]
    }
}
