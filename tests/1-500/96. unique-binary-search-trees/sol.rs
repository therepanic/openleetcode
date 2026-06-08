impl Solution {
    pub fn num_trees(n: i32) -> i32 {
        let n = n as usize;
        let mut dp = vec![0; n + 1];
        dp[0] = 1;
        dp[1] = 1;

        for nodes in 2..=n {
            for root in 1..=nodes {
                dp[nodes] += dp[root - 1] * dp[nodes - root];
            }
        }

        dp[n]
    }
}
