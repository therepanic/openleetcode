impl Solution {
    pub fn min_distance(word1: String, word2: String) -> i32 {
        let n = word1.len();
        let m = word2.len();
        let word1 = word1.as_bytes();
        let word2 = word2.as_bytes();
        let mut dp = vec![vec![0i32; m + 1]; n + 1];

        for i in 1..=n {
            for j in 1..=m {
                if word1[i-1] == word2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1];
                } else {
                    dp[i][j] = dp[i-1][j].max(dp[i][j-1]);
                }
            }
        }
        
        (n + m) as i32 - 2 * dp[n][m]
    }
}
