impl Solution {
    pub fn count_bits(n: i32) -> Vec<i32> {
        let n = n as usize;
        let mut dp = vec![0; n + 1];
        let mut sub = 1;
        for i in 1..=n {
            if sub * 2 == i {
                sub = i;
            }
            dp[i] = dp[i - sub] + 1;
        }
        dp
    }
}
