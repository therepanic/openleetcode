impl Solution {
    pub fn min_distance(word1: String, word2: String) -> i32 {
        let a = word1.as_bytes();
        let b = word2.as_bytes();
        let mut dp: Vec<i32> = (0..=b.len() as i32).collect();

        for i in 1..=a.len() {
            let mut prev = dp[0];
            dp[0] = i as i32;
            for j in 1..=b.len() {
                let temp = dp[j];
                if a[i - 1] == b[j - 1] {
                    dp[j] = prev;
                } else {
                    dp[j] = 1 + prev.min(dp[j]).min(dp[j - 1]);
                }
                prev = temp;
            }
        }

        dp[b.len()]
    }
}
