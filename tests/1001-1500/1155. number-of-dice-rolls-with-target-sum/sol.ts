function numRollsToTarget(n: number, k: number, target: number): number {
  const MOD = 1000000007;

  let dp: number[] = new Array(target + 1).fill(0);
  dp[0] = 1;

  for (let i = 0; i < n; i++) {
    const newDp: number[] = new Array(target + 1).fill(0);
    let windowSum = 0;

    for (let s = 1; s <= target; s++) {
      windowSum = (windowSum + dp[s - 1]) % MOD;

      if (s > k) {
        windowSum = (windowSum - dp[s - k - 1] + MOD) % MOD;
      }

      newDp[s] = windowSum;
    }

    dp = newDp;
  }

  return dp[target];
}
