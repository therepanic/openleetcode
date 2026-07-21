class Solution {
  int minInsertions(String s) {
    int n = s.length;
    String s2 = s.split('').reversed.join('');
    List<List<int>> dp = List.generate(n + 1, (_) => List.filled(n + 1, 0));
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= n; j++) {
        if (s[i - 1] == s2[j - 1]) {
          dp[i][j] = 1 + dp[i - 1][j - 1];
        } else {
          dp[i][j] = dp[i - 1][j] > dp[i][j - 1] ? dp[i - 1][j] : dp[i][j - 1];
        }
      }
    }
    return n - dp[n][n];
  }
}
