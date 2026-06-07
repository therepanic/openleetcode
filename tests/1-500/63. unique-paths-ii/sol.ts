function uniquePathsWithObstacles(obstacleGrid: number[][]): number {
  const rows = obstacleGrid.length;
  const cols = obstacleGrid[0].length;
  const dp = new Array<number>(cols).fill(0);
  if (obstacleGrid[0][0] === 0) {
    dp[0] = 1;
  }

  for (let row = 0; row < rows; row++) {
    for (let col = 0; col < cols; col++) {
      if (obstacleGrid[row][col] === 1) {
        dp[col] = 0;
      } else if (col > 0) {
        dp[col] += dp[col - 1];
      }
    }
  }

  return dp[cols - 1];
}
