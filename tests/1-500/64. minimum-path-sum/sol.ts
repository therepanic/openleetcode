function minPathSum(grid: number[][]): number {
  const rows = grid.length;
  const cols = grid[0].length;
  const dp = new Array<number>(cols).fill(0);
  dp[0] = grid[0][0];

  for (let col = 1; col < cols; col++) {
    dp[col] = dp[col - 1] + grid[0][col];
  }

  for (let row = 1; row < rows; row++) {
    dp[0] += grid[row][0];
    for (let col = 1; col < cols; col++) {
      dp[col] = Math.min(dp[col], dp[col - 1]) + grid[row][col];
    }
  }

  return dp[cols - 1];
}
