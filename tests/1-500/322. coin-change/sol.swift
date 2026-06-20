class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        if amount >= 1 {
            for i in 1...amount {
                for coin in coins {
                    if i - coin >= 0 {
                        dp[i] = min(dp[i], 1 + dp[i - coin])
                    }
                }
            }
        }
        
        return dp[amount] != amount + 1 ? dp[amount] : -1
    }
}
