class Solution {
  int longestPalindromeSubseq(String s) {
    int n = s.length;
    List<List<int>> dp = List.generate(n, (_) => List.filled(n, 0));
    for (int i = n - 1; i >= 0; i--) {
      dp[i][i] = 1;
      for (int j = i + 1; j < n; j++) {
        if (s[i] == s[j]) {
          dp[i][j] = dp[i + 1][j - 1] + 2;
        } else {
          dp[i][j] = dp[i + 1][j] > dp[i][j - 1] ? dp[i + 1][j] : dp[i][j - 1];
        }
      }
    }
    return dp[0][n - 1];
  }
}
