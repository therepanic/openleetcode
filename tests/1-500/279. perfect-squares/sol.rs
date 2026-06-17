impl Solution {
    pub fn num_squares(n: i32) -> i32 {
        let n = n as usize;
        let mut dp = vec![i32::MAX; n + 1];
        dp[0] = 0;

        for i in 1..=n {
            let mut j = 1;
            while j * j <= i {
                dp[i] = dp[i].min(dp[i - j * j] + 1);
                j += 1;
            }
        }

        dp[n]
    }
}
