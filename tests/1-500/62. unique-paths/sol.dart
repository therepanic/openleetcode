class Solution {
  int uniquePaths(int m, int n) {
    final dp = List<int>.filled(n, 1);
    for (var row = 1; row < m; row++) {
      for (var col = 1; col < n; col++) {
        dp[col] += dp[col - 1];
      }
    }
    return dp[n - 1];
  }
}
