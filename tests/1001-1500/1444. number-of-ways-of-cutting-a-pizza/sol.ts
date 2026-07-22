function ways(pizza: string[], k: number): number {
  const m = pizza.length,
    n = pizza[0].length,
    MOD = 1_000_000_007;
  const preSum: number[][] = Array.from({ length: m + 1 }, () =>
    Array(n + 1).fill(0),
  );

  for (let r = m - 1; r >= 0; r--) {
    for (let c = n - 1; c >= 0; c--) {
      preSum[r][c] =
        preSum[r][c + 1] +
        preSum[r + 1][c] -
        preSum[r + 1][c + 1] +
        (pizza[r][c] === "A" ? 1 : 0);
    }
  }

  const dp: number[][][] = Array.from({ length: k }, () =>
    Array.from({ length: m }, () => Array(n).fill(0)),
  );

  for (let r = 0; r < m; r++) {
    for (let c = 0; c < n; c++) {
      dp[0][r][c] = preSum[r][c] > 0 ? 1 : 0;
    }
  }

  for (let cuts = 1; cuts < k; cuts++) {
    for (let r = 0; r < m; r++) {
      for (let c = 0; c < n; c++) {
        if (preSum[r][c] === 0) continue;
        let ans = 0;
        for (let nr = r + 1; nr < m; nr++) {
          if (preSum[r][c] - preSum[nr][c] > 0) {
            ans = (ans + dp[cuts - 1][nr][c]) % MOD;
          }
        }
        for (let nc = c + 1; nc < n; nc++) {
          if (preSum[r][c] - preSum[r][nc] > 0) {
            ans = (ans + dp[cuts - 1][r][nc]) % MOD;
          }
        }
        dp[cuts][r][c] = ans;
      }
    }
  }

  return dp[k - 1][0][0];
}
