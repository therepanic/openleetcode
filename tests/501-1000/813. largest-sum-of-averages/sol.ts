function largestSumOfAverages(nums: number[], k: number): number {
  const n = nums.length;
  const pref: number[] = [0];
  for (const x of nums) pref.push(pref[pref.length - 1] + x);
  const dp: number[][] = Array.from({ length: n + 1 }, () =>
    Array(k + 1).fill(0),
  );
  for (let i = 1; i <= n; i++) {
    dp[i][1] = pref[i] / i;
  }
  for (let p = 2; p <= k; p++) {
    for (let i = p; i <= n; i++) {
      let best = 0.0;
      for (let j = p - 1; j < i; j++) {
        const val = dp[j][p - 1] + (pref[i] - pref[j]) / (i - j);
        if (val > best) best = val;
      }
      dp[i][p] = best;
    }
  }
  return dp[n][k];
}
