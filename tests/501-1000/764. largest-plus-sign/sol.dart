class Solution {
  int orderOfLargestPlusSign(int n, List<List<int>> mines) {
    Set<int> s = {};
    for (var mine in mines) {
      s.add(mine[0] * n + mine[1]);
    }
    List<List<int>> dp = List.generate(n, (_) => List.filled(n, n));
    
    for (int i = 0; i < n; i++) {
      int count = 0;
      for (int j = 0; j < n; j++) {
        count = s.contains(i * n + j) ? 0 : count + 1;
        dp[i][j] = dp[i][j] < count ? dp[i][j] : count;
      }
      count = 0;
      for (int j = n - 1; j >= 0; j--) {
        count = s.contains(i * n + j) ? 0 : count + 1;
        dp[i][j] = dp[i][j] < count ? dp[i][j] : count;
      }
    }
    
    for (int j = 0; j < n; j++) {
      int count = 0;
      for (int i = 0; i < n; i++) {
        count = s.contains(i * n + j) ? 0 : count + 1;
        dp[i][j] = dp[i][j] < count ? dp[i][j] : count;
      }
      count = 0;
      for (int i = n - 1; i >= 0; i--) {
        count = s.contains(i * n + j) ? 0 : count + 1;
        dp[i][j] = dp[i][j] < count ? dp[i][j] : count;
      }
    }
    
    int ans = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (dp[i][j] > ans) ans = dp[i][j];
      }
    }
    return ans;
  }
}
