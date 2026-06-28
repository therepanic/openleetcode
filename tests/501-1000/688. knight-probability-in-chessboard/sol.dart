class Solution {
  double knightProbability(int n, int k, int row, int column) {
    if (k == 0) return 1.0;
    
    final moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]];
    
    List<List<double>> dp = List.generate(n, (_) => List.filled(n, 0.0));
    dp[row][column] = 1.0;
    
    for (int step = 0; step < k; step++) {
      List<List<double>> nextDp = List.generate(n, (_) => List.filled(n, 0.0));
      for (int r = 0; r < n; r++) {
        for (int c = 0; c < n; c++) {
          if (dp[r][c] == 0.0) continue;
          for (final move in moves) {
            int nr = r + move[0];
            int nc = c + move[1];
            if (nr >= 0 && nr < n && nc >= 0 && nc < n) {
              nextDp[nr][nc] += dp[r][c] / 8.0;
            }
          }
        }
      }
      dp = nextDp;
    }
    
    double total = 0.0;
    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        total += dp[r][c];
      }
    }
    return total;
  }
}
