function orderOfLargestPlusSign(n: number, mines: number[][]): number {
  const s = new Set<number>();
  for (const mine of mines) {
    s.add(mine[0] * n + mine[1]);
  }
  const dp: number[][] = Array.from({ length: n }, () => Array(n).fill(n));

  for (let i = 0; i < n; i++) {
    let count = 0;
    for (let j = 0; j < n; j++) {
      count = s.has(i * n + j) ? 0 : count + 1;
      dp[i][j] = Math.min(dp[i][j], count);
    }
    count = 0;
    for (let j = n - 1; j >= 0; j--) {
      count = s.has(i * n + j) ? 0 : count + 1;
      dp[i][j] = Math.min(dp[i][j], count);
    }
  }

  for (let j = 0; j < n; j++) {
    let count = 0;
    for (let i = 0; i < n; i++) {
      count = s.has(i * n + j) ? 0 : count + 1;
      dp[i][j] = Math.min(dp[i][j], count);
    }
    count = 0;
    for (let i = n - 1; i >= 0; i--) {
      count = s.has(i * n + j) ? 0 : count + 1;
      dp[i][j] = Math.min(dp[i][j], count);
    }
  }

  let ans = 0;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      ans = Math.max(ans, dp[i][j]);
    }
  }
  return ans;
}
