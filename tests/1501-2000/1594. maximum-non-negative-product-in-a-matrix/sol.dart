class Solution {
  int maxProductPath(List<List<int>> grid) {
    int r = grid.length;
    int c = grid[0].length;
    const int MOD = 1000000007;
    List<List<List<int>>> dp = List.generate(r, (i) => List.generate(c, (j) => List.filled(2, 0)));
    
    int p = grid[0][0];
    dp[0][0][0] = p;
    dp[0][0][1] = p;
    for (int j = 1; j < c; j++) {
      p *= grid[0][j];
      dp[0][j][0] = p;
      dp[0][j][1] = p;
    }
    
    p = grid[0][0];
    for (int i = 1; i < r; i++) {
      p *= grid[i][0];
      dp[i][0][0] = p;
      dp[i][0][1] = p;
      for (int j = 1; j < c; j++) {
        int x = grid[i][j];
        List<int> vals = [x * dp[i][j-1][0], x * dp[i][j-1][1], x * dp[i-1][j][0], x * dp[i-1][j][1]];
        dp[i][j][0] = vals.reduce((a, b) => a < b ? a : b);
        dp[i][j][1] = vals.reduce((a, b) => a > b ? a : b);
      }
    }
    
    int ans = dp[r-1][c-1][1];
    if (ans < 0) return -1;
    return ans % MOD;
  }
}
