class Solution {
  int cherryPickup(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    List<List<List<int>>> dp = List.generate(m, (_) => List.generate(n, (_) => List.filled(n, -1)));
    dp[0][0][n-1] = grid[0][0] + grid[0][n-1];

    for (int i = 1; i < m; i++) {
      for (int j = 0; j < n; j++) {
        for (int k = j+1; k < n; k++) {
          for (int x = -1; x <= 1; x++) {
            for (int y = -1; y <= 1; y++) {
              int nj = j + x;
              int nk = k + y;
              if (nj >= 0 && nj < n && nk >= 0 && nk < n) {
                int prev = dp[i-1][nj][nk];
                if (prev != -1) {
                  int add = grid[i][j];
                  if (j != k) add += grid[i][k];
                  dp[i][j][k] = max(dp[i][j][k], prev + add);
                }
              }
            }
          }
        }
      }
    }

    int ans = -1;
    for (var row in dp[m-1]) {
      for (var v in row) {
        if (v > ans) ans = v;
      }
    }
    return ans != -1 ? ans : 0;
  }
  
  int max(int a, int b) => a > b ? a : b;
}
