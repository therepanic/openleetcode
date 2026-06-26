impl Solution {
    pub fn change(amount: i32, coins: Vec<i32>) -> i32 {
        let n = coins.len();
        let amount = amount as usize;
        let mut dp = vec![vec![0; amount + 1]; n + 1];
        
        for i in 0..=n {
            dp[i][0] = 1;
        }
        
        for i in 1..=n {
            for j in 1..=amount {
                if coins[i-1] as usize <= j {
                    dp[i][j] = dp[i][j - coins[i-1] as usize] + dp[i-1][j];
                } else {
                    dp[i][j] = dp[i-1][j];
                }
            }
        }
        
        dp[n][amount]
    }
}
