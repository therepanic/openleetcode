class Solution {
  int colorTheGrid(int m, int n) {
    final mod = 1000000007;
    int total = 1;
    for (int i = 0; i < m; i++) {
      total *= 3;
    }
    List<List<int>> dp = List.generate(n + 1, (_) => List.filled(total, 0));
    List<List<int>> rowValid = List.generate(total, (_) => List.filled(total, 0));
    List<int> good = [];
    List<List<int>> pattern = List.generate(total, (_) => List.filled(m, 0));
    for (int i = 0; i < total; i++) {
      int val = i;
      bool valid = true;
      for (int k = 0; k < m; k++) {
        pattern[i][k] = val % 3;
        val ~/= 3;
      }
      for (int k = 1; k < m; k++) {
        if (pattern[i][k] == pattern[i][k - 1]) {
          valid = false;
          break;
        }
      }
      if (valid) {
        good.add(i);
      }
    }
    for (int i in good) {
      dp[1][i] = 1;
    }
    for (int i in good) {
      for (int j in good) {
        rowValid[i][j] = 1;
        for (int k = 0; k < m; k++) {
          if (pattern[i][k] == pattern[j][k]) {
            rowValid[i][j] = 0;
            break;
          }
        }
      }
    }
    for (int col = 2; col <= n; col++) {
      for (int i in good) {
        int totalWays = 0;
        for (int j in good) {
          if (rowValid[i][j] == 1) {
            totalWays += dp[col - 1][j];
          }
        }
        dp[col][i] = totalWays % mod;
      }
    }
    int ans = 0;
    for (int i in good) {
      ans += dp[n][i];
    }
    return ans % mod;
  }
}
