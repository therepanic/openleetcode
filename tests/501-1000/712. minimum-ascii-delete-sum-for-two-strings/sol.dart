class Solution {
  int minimumDeleteSum(String s1, String s2) {
    int n = s1.length, m = s2.length;
    List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (s1[i] == s2[j]) {
          dp[i + 1][j + 1] = dp[i][j] + s1.codeUnitAt(i);
        } else {
          dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j]);
        }
      }
    }
    int totalAscii = 0;
    for (int i = 0; i < n; i++) totalAscii += s1.codeUnitAt(i);
    for (int j = 0; j < m; j++) totalAscii += s2.codeUnitAt(j);
    return totalAscii - 2 * dp[n][m];
  }
}
