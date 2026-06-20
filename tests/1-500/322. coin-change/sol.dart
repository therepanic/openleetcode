class Solution {
  int coinChange(List<int> coins, int amount) {
    List<int> dp = List.filled(amount + 1, amount + 1);
    dp[0] = 0;
    
    for (int i = 1; i <= amount; i++) {
      for (int coin in coins) {
        if (i - coin >= 0) {
          dp[i] = (dp[i] < 1 + dp[i - coin]) ? dp[i] : 1 + dp[i - coin];
        }
      }
    }
    
    return dp[amount] != amount + 1 ? dp[amount] : -1;
  }
}
