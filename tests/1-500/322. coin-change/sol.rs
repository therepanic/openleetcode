impl Solution {
    pub fn coin_change(coins: Vec<i32>, amount: i32) -> i32 {
        let amount = amount as usize;
        let mut dp = vec![amount + 1; amount + 1];
        dp[0] = 0;
        
        for i in 1..=amount {
            for &coin in &coins {
                let coin = coin as usize;
                if i >= coin {
                    dp[i] = dp[i].min(1 + dp[i - coin]);
                }
            }
        }
        
        if dp[amount] != amount + 1 {
            dp[amount] as i32
        } else {
            -1
        }
    }
}
