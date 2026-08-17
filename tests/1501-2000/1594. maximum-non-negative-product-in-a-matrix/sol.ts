function maxProductPath(grid: number[][]): number {
  const r = grid.length;
  const c = grid[0].length;
  const MOD = 1000000007;
  const dp: number[][][] = Array.from({ length: r }, () =>
    Array.from({ length: c }, () => [0, 0]),
  );

  let p = grid[0][0];
  dp[0][0][0] = p;
  dp[0][0][1] = p;
  for (let j = 1; j < c; j++) {
    p *= grid[0][j];
    dp[0][j][0] = p;
    dp[0][j][1] = p;
  }

  p = grid[0][0];
  for (let i = 1; i < r; i++) {
    p *= grid[i][0];
    dp[i][0][0] = p;
    dp[i][0][1] = p;
    for (let j = 1; j < c; j++) {
      const x = grid[i][j];
      const vals = [
        x * dp[i][j - 1][0],
        x * dp[i][j - 1][1],
        x * dp[i - 1][j][0],
        x * dp[i - 1][j][1],
      ];
      dp[i][j][0] = Math.min(...vals);
      dp[i][j][1] = Math.max(...vals);
    }
  }

  const ans = dp[r - 1][c - 1][1];
  if (ans < 0) return -1;
  return ans % MOD;
}
