class Solution {
  int getLengthOfOptimalCompression(String s, int k) {
    int n = s.length;
    List<List<int>> dp = List.generate(110, (_) => List.filled(110, 9999));
    dp[0][0] = 0;

    for (int i = 1; i <= n; i++) {
      for (int j = 0; j <= k; j++) {
        int cnt = 0, del = 0;
        for (int l = i; l >= 1; l--) {
          if (s[l - 1] == s[i - 1]) {
            cnt++;
          } else {
            del++;
          }
          if (j - del >= 0) {
            int add = cnt >= 100 ? 3 : (cnt >= 10 ? 2 : (cnt >= 2 ? 1 : 0));
            dp[i][j] = (dp[i][j] < dp[l - 1][j - del] + 1 + add) ? dp[i][j] : dp[l - 1][j - del] + 1 + add;
          }
        }
        if (j > 0) {
          dp[i][j] = (dp[i][j] < dp[i - 1][j - 1]) ? dp[i][j] : dp[i - 1][j - 1];
        }
      }
    }
    return dp[n][k];
  }
}
