class Solution {
  int numberOfCombinations(String num) {
    int n = num.length;
    const int MOD = 1000000007;
    List<List<int>> dp = List.generate(n, (_) => List.filled(n + 1, 0));
    for (int i = 0; i < n; i++) {
      if (num[i] != '0') {
        for (int j = i + 1; j <= n; j++) {
          if (i == 0) {
            dp[i][j] = 1;
          } else {
            int length = j - i;
            dp[i][j] = dp[i][j - 1];
            if (i - length >= 0 && num.substring(i - length, i).compareTo(num.substring(i, j)) <= 0) {
              dp[i][j] = (dp[i][j] + dp[i - length][i]) % MOD;
            }
            if (i - length + 1 >= 0 && num.substring(i - length + 1, i).compareTo(num.substring(i, j - 1)) > 0) {
              dp[i][j] = (dp[i][j] + dp[i - length + 1][i]) % MOD;
            }
          }
        }
      }
    }
    int ans = 0;
    for (int i = 0; i < n; i++) {
      ans = (ans + dp[i][n]) % MOD;
    }
    return ans;
  }
}
