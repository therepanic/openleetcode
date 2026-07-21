class Solution {
  int numRollsToTarget(int n, int k, int target) {
    const int MOD = 1000000007;
    
    var dp = List<int>.filled(target + 1, 0);
    dp[0] = 1;
    
    for (int i = 0; i < n; i++) {
      var newDp = List<int>.filled(target + 1, 0);
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
