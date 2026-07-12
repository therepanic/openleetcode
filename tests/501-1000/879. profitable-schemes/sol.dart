class Solution {
  int profitableSchemes(int n, int minProfit, List<int> group, List<int> profit) {
    const int mod = 1000000007;
    List<List<int>> dp = List.generate(n + 1, (_) => List.filled(minProfit + 1, 0));
    dp[0][0] = 1;
    for (int k = 1; k <= group.length; k++) {
      int g = group[k - 1];
      int p = profit[k - 1];
      for (int i = n; i >= g; i--) {
        for (int j = minProfit; j >= 0; j--) {
          int prev = j - p >= 0 ? dp[i - g][j - p] : dp[i - g][0];
          dp[i][j] = (dp[i][j] + prev) % mod;
        }
      }
    }
    int ans = 0;
    for (int i = 0; i <= n; i++) {
      ans = (ans + dp[i][minProfit]) % mod;
    }
    return ans;
  }
}
