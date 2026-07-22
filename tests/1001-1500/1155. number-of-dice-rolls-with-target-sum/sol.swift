class Solution {
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        let MOD = 1000000007
        
        var dp = Array(repeating: 0, count: target + 1)
        dp[0] = 1
        
        for _ in 0..<n {
            var newDp = Array(repeating: 0, count: target + 1)
            var windowSum = 0
            
            for s in 1...target {
                windowSum = (windowSum + dp[s - 1]) % MOD
                
                if s > k {
                    windowSum = (windowSum - dp[s - k - 1] + MOD) % MOD
                }
                
                newDp[s] = windowSum
            }
            
            dp = newDp
        }
        
        return dp[target]
    }
}
