class Solution {
  int change(int amount, List<int> coins) {
    int n = coins.length;
    List<List<int>> dp = List.generate(n + 1, (_) => List.filled(amount + 1, 0));
    
    for (int i = 0; i <= n; i++) {
      dp[i][0] = 1;
    }
    
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= amount; j++) {
        if (coins[i-1] <= j) {
          dp[i][j] = dp[i][j - coins[i-1]] + dp[i-1][j];
        } else {
          dp[i][j] = dp[i-1][j];
        }
      }
    }
    
    return dp[n][amount];
  }
}
