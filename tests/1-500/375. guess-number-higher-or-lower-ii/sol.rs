impl Solution {
    pub fn get_money_amount(n: i32) -> i32 {
        let n = n as usize;
        let mut dp = vec![vec![0; n + 1]; n + 1];
        for length in 2..=n {
            for start in (1..=n - length + 1).rev() {
                let end = start + length - 1;
                dp[start][end] = i32::MAX;
                for pivot in start..=end {
                    let left = if pivot > start { dp[start][pivot - 1] } else { 0 };
                    let right = if pivot < end { dp[pivot + 1][end] } else { 0 };
                    dp[start][end] = dp[start][end].min(pivot as i32 + left.max(right));
                }
            }
        }
        dp[1][n]
    }
}
