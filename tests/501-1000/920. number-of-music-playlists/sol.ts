function numMusicPlaylists(n: number, goal: number, k: number): number {
  const MOD = 1000000007;
  const dp: number[][] = [new Array(n + 1).fill(0), new Array(n + 1).fill(0)];
  dp[0][0] = 1;

  for (let i = 1; i <= goal; i++) {
    dp[i % 2][0] = 0;
    const limit = Math.min(i, n);
    for (let j = 1; j <= limit; j++) {
      dp[i % 2][j] = (dp[(i - 1) % 2][j - 1] * (n - (j - 1))) % MOD;
      if (j > k) {
        dp[i % 2][j] = (dp[i % 2][j] + dp[(i - 1) % 2][j] * (j - k)) % MOD;
      }
    }
  }

  return dp[goal % 2][n];
}
