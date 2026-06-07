function uniquePaths(m: number, n: number): number {
  const dp = new Array(n).fill(1);
  for (let row = 1; row < m; row++) {
    for (let col = 1; col < n; col++) {
      dp[col] += dp[col - 1];
    }
  }
  return dp[n - 1];
}
