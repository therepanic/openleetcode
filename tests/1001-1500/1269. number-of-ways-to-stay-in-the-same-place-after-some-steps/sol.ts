function numWays(steps: number, arrLen: number): number {
  const MOD = 1000000007;
  const maxPos = Math.min(Math.floor(steps / 2), arrLen - 1);
  let dp: number[] = new Array(maxPos + 1).fill(0);
  dp[0] = 1;
  for (let step = 0; step < steps; step++) {
    const newDp: number[] = new Array(maxPos + 1).fill(0);
    for (let pos = 0; pos <= maxPos; pos++) {
      if (dp[pos] === 0) continue;
      newDp[pos] = (newDp[pos] + dp[pos]) % MOD;
      if (pos > 0) newDp[pos - 1] = (newDp[pos - 1] + dp[pos]) % MOD;
      if (pos < maxPos) newDp[pos + 1] = (newDp[pos + 1] + dp[pos]) % MOD;
    }
    dp = newDp;
  }
  return dp[0];
}
