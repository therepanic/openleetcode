class Solution {
  int minPathSum(List<List<int>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;
    final dp = List<int>.filled(cols, 0);
    dp[0] = grid[0][0];

    for (var col = 1; col < cols; col++) {
      dp[col] = dp[col - 1] + grid[0][col];
    }

    for (var row = 1; row < rows; row++) {
      dp[0] += grid[row][0];
      for (var col = 1; col < cols; col++) {
        final best = dp[col] < dp[col - 1] ? dp[col] : dp[col - 1];
        dp[col] = best + grid[row][col];
      }
    }

    return dp[cols - 1];
  }
}
