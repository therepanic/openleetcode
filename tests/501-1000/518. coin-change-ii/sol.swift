class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        let n = coins.count
        var dp = Array(repeating: Array(repeating: 0, count: amount + 1), count: n + 1)
        
        for i in 0...n {
            dp[i][0] = 1
        }
        
        if n > 0 && amount > 0 {
            for i in 1...n {
                for j in 1...amount {
                    if coins[i-1] <= j {
                        dp[i][j] = dp[i][j - coins[i-1]] + dp[i-1][j]
                    } else {
                        dp[i][j] = dp[i-1][j]
                    }
                }
            }
        }

        return dp[n][amount]
    }
}
