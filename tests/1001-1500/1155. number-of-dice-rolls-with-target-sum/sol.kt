class Solution {
    fun numRollsToTarget(n: Int, k: Int, target: Int): Int {
        val MOD = 1000000007
        
        var dp = IntArray(target + 1)
        dp[0] = 1
        
        for (i in 0 until n) {
            val newDp = IntArray(target + 1)
            var windowSum = 0
            
            for (s in 1..target) {
                windowSum = (windowSum + dp[s - 1]) % MOD
                
                if (s > k) {
                    windowSum = (windowSum - dp[s - k - 1] + MOD) % MOD
                }
                
                newDp[s] = windowSum
            }
            
            dp = newDp
        }
        
        return dp[target]
    }
}
