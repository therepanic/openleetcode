impl Solution {
    pub fn min_steps(n: i32) -> i32 {
        if n == 1 {
            return 0;
        }
        let n = n as usize;
        let mut dp = vec![0; n + 1];
        for i in 2..=n {
            dp[i] = i as i32;
            for j in (1..i).rev() {
                if i % j == 0 {
                    dp[i] = dp[j] + (i / j) as i32;
                    break;
                }
            }
        }
        dp[n]
    }
}
