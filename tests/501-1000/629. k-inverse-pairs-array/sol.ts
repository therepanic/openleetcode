function kInversePairs(n: number, k: number): number {
  const MOD = 1000000007;
  const dp: number[][] = Array.from({ length: n + 1 }, () =>
    Array(k + 1).fill(0),
  );

  for (let i = 1; i <= n; i++) {
    for (let j = 0; j <= k; j++) {
      if (j === 0) {
        dp[i][j] = 1;
      } else {
        let val = dp[i - 1][j];
        if (j - i >= 0) {
          val = (val - dp[i - 1][j - i] + MOD) % MOD;
        }
        dp[i][j] = (dp[i][j - 1] + val) % MOD;
      }
    }
  }

  let result = dp[n][k];
  if (k > 0) {
    result = (result - dp[n][k - 1] + MOD) % MOD;
  }
  return result;
}
