class Solution {
  int palindromePartition(String s, int k) {
    int n = s.length;
    List<List<int>> c = List.generate(n, (_) => List.filled(n, 0));
    for (int l = 2; l <= n; l++) {
      for (int i = 0; i <= n - l; i++) {
        int j = i + l - 1;
        c[i][j] = (l > 2 ? c[i + 1][j - 1] : 0) + (s[i] != s[j] ? 1 : 0);
      }
    }
    List<List<int>> dp = List.generate(k + 1, (_) => List.filled(n + 1, 1 << 30));
    dp[0][0] = 0;
    for (int i = 1; i <= n; i++) {
      dp[1][i] = c[0][i - 1];
    }
    for (int p = 2; p <= k; p++) {
      for (int i = p; i <= n; i++) {
        int mn = 1 << 30;
        for (int t = p - 1; t < i; t++) {
          mn = mn < dp[p - 1][t] + c[t][i - 1] ? mn : dp[p - 1][t] + c[t][i - 1];
        }
        dp[p][i] = mn;
      }
    }
    return dp[k][n];
  }
}
