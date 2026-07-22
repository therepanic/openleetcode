class Solution {
  int ways(List<String> pizza, int k) {
    int m = pizza.length, n = pizza[0].length;
    int MOD = 1000000007;
    List<List<int>> preSum = List.generate(m + 1, (_) => List.filled(n + 1, 0));

    for (int r = m - 1; r >= 0; r--) {
      for (int c = n - 1; c >= 0; c--) {
        preSum[r][c] = preSum[r][c + 1] + preSum[r + 1][c] - preSum[r + 1][c + 1] + (pizza[r][c] == 'A' ? 1 : 0);
      }
    }

    List<List<List<int>>> dp = List.generate(k, (_) => List.generate(m, (_) => List.filled(n, 0)));

    for (int r = 0; r < m; r++) {
      for (int c = 0; c < n; c++) {
        dp[0][r][c] = preSum[r][c] > 0 ? 1 : 0;
      }
    }

    for (int cuts = 1; cuts < k; cuts++) {
      for (int r = 0; r < m; r++) {
        for (int c = 0; c < n; c++) {
          if (preSum[r][c] == 0) continue;
          int ans = 0;
          for (int nr = r + 1; nr < m; nr++) {
            if (preSum[r][c] - preSum[nr][c] > 0) {
              ans = (ans + dp[cuts - 1][nr][c]) % MOD;
            }
          }
          for (int nc = c + 1; nc < n; nc++) {
            if (preSum[r][c] - preSum[r][nc] > 0) {
              ans = (ans + dp[cuts - 1][r][nc]) % MOD;
            }
          }
          dp[cuts][r][c] = ans;
        }
      }
    }

    return dp[k - 1][0][0];
  }
}
