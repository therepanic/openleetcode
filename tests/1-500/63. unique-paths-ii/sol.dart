class Solution {
  int uniquePathsWithObstacles(List<List<int>> obstacleGrid) {
    final rows = obstacleGrid.length;
    final cols = obstacleGrid[0].length;
    final dp = List<int>.filled(cols, 0);
    if (obstacleGrid[0][0] == 0) {
      dp[0] = 1;
    }

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        if (obstacleGrid[row][col] == 1) {
          dp[col] = 0;
        } else if (col > 0) {
          dp[col] += dp[col - 1];
        }
      }
    }

    return dp[cols - 1];
  }
}
