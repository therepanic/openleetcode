class Solution {
  int numMusicPlaylists(int n, int goal, int k) {
    const int MOD = 1000000007;
    List<List<int>> dp = [
      List.filled(n + 1, 0),
      List.filled(n + 1, 0)
    ];
    dp[0][0] = 1;

    for (int i = 1; i <= goal; i++) {
      dp[i % 2][0] = 0;
      int limit = i < n ? i : n;
      for (int j = 1; j <= limit; j++) {
        dp[i % 2][j] = (dp[(i - 1) % 2][j - 1] * (n - (j - 1))) % MOD;
        if (j > k) {
          dp[i % 2][j] = (dp[i % 2][j] + dp[(i - 1) % 2][j] * (j - k)) % MOD;
        }
      }
    }

    return dp[goal % 2][n];
  }
}
