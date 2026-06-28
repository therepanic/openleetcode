class Solution {
  int findPaths(int m, int n, int maxMove, int startRow, int startColumn) {
    const int MOD = 1000000007;
    List<List<List<int>>> dp = List.generate(maxMove + 1, (_) => List.generate(m, (_) => List.filled(n, 0)));
    List<List<int>> directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];

    for (int move = 1; move <= maxMove; move++) {
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          for (var dir in directions) {
            int x = i + dir[0];
            int y = j + dir[1];
            if (x < 0 || x >= m || y < 0 || y >= n) {
              dp[move][i][j] = (dp[move][i][j] + 1) % MOD;
            } else {
              dp[move][i][j] = (dp[move][i][j] + dp[move - 1][x][y]) % MOD;
            }
          }
        }
      }
    }

    return dp[maxMove][startRow][startColumn];
  }
}
