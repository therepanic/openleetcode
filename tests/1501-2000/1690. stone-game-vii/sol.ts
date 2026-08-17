function stoneGameVII(stones: number[]): number {
  const n = stones.length;
  const prefix = new Array(n + 1).fill(0);

  for (let i = 0; i < n; i++) {
    prefix[i + 1] = prefix[i] + stones[i];
  }

  const dp: number[][] = Array.from({ length: n }, () => new Array(n).fill(0));

  for (let length = 2; length <= n; length++) {
    for (let i = 0; i <= n - length; i++) {
      const j = i + length - 1;
      const total = prefix[j + 1] - prefix[i];
      dp[i][j] = Math.max(
        total - stones[i] - dp[i + 1][j],
        total - stones[j] - dp[i][j - 1],
      );
    }
  }

  return dp[0][n - 1];
}
