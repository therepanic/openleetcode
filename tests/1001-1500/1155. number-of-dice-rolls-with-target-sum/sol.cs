public class Solution {
    public int NumRollsToTarget(int n, int k, int target) {
        const int MOD = 1000000007;
        
        int[] dp = new int[target + 1];
        dp[0] = 1;
        
        for (int i = 0; i < n; i++) {
            int[] newDp = new int[target + 1];
            int windowSum = 0;
            
            for (int s = 1; s <= target; s++) {
                windowSum = (windowSum + dp[s - 1]) % MOD;
                
                if (s > k) {
                    windowSum = (windowSum - dp[s - k - 1] + MOD) % MOD;
                }
                
                newDp[s] = windowSum;
            }
            
            dp = newDp;
        }
        
        return dp[target];
    }
}
