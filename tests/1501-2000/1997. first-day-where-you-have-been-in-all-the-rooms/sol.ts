function firstDayBeenInAllRooms(nextVisit: number[]): number {
  const MOD = 1000000007;
  const n = nextVisit.length;
  const dp: number[] = new Array(n).fill(0);

  for (let i = 1; i < n; i++) {
    dp[i] = (2 * dp[i - 1] - dp[nextVisit[i - 1]] + 2 + MOD) % MOD;
  }

  return dp[n - 1];
}
