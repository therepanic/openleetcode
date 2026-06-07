class Solution {
  bool isMatch(String s, String p) {
    final m = s.length;
    final n = p.length;
    final dp = List.generate(m + 1, (_) => List.filled(n + 1, false));
    dp[0][0] = true;

    for (var j = 1; j <= n; j++) {
      if (p[j - 1] == '*') {
        dp[0][j] = dp[0][j - 1];
      }
    }

    for (var i = 1; i <= m; i++) {
      for (var j = 1; j <= n; j++) {
        if (p[j - 1] == '?' || p[j - 1] == s[i - 1]) {
          dp[i][j] = dp[i - 1][j - 1];
        } else if (p[j - 1] == '*') {
          dp[i][j] = dp[i][j - 1] || dp[i - 1][j];
        }
      }
    }

    return dp[m][n];
  }
}
