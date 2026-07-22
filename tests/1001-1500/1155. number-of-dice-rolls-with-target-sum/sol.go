func numRollsToTarget(n int, k int, target int) int {
    const MOD = 1000000007
    
    dp := make([]int, target + 1)
    dp[0] = 1
    
    for i := 0; i < n; i++ {
        newDp := make([]int, target + 1)
        windowSum := 0
        
        for s := 1; s <= target; s++ {
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
