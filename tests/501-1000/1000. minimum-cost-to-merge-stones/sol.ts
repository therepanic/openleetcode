function mergeStones(stones: number[], k: number): number {
  const n = stones.length;
  if ((n - 1) % (k - 1) !== 0) return -1;

  const prefix: number[] = new Array(n + 1).fill(0);
  for (let i = 1; i <= n; i++) {
    prefix[i] = prefix[i - 1] + stones[i - 1];
  }

  const dp: number[][][] = Array.from({ length: n }, () =>
    Array.from({ length: n }, () => new Array(k + 1).fill(Infinity)),
  );

  for (let i = 0; i < n; i++) {
    dp[i][i][1] = 0;
  }

  for (let len = 2; len <= n; len++) {
    for (let i = 0; i + len - 1 < n; i++) {
      const j = i + len - 1;
      for (let p = 2; p <= k; p++) {
        for (let m = i; m < j; m += k - 1) {
          if (dp[i][m][1] !== Infinity && dp[m + 1][j][p - 1] !== Infinity) {
            dp[i][j][p] = Math.min(
              dp[i][j][p],
              dp[i][m][1] + dp[m + 1][j][p - 1],
            );
          }
        }
      }
      if (dp[i][j][k] !== Infinity) {
        dp[i][j][1] = dp[i][j][k] + (prefix[j + 1] - prefix[i]);
      }
    }
  }

  return dp[0][n - 1][1] === Infinity ? -1 : dp[0][n - 1][1];
}
