class Solution {
  int minDistance(String word1, String word2) {
    int n = word1.length, m = word2.length;
    List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= m; j++) {
        if (word1[i-1] == word2[j-1]) {
          dp[i][j] = 1 + dp[i-1][j-1];
        } else {
          dp[i][j] = dp[i-1][j] > dp[i][j-1] ? dp[i-1][j] : dp[i][j-1];
        }
      }
    }
    
    return n + m - 2 * dp[n][m];
  }
}
