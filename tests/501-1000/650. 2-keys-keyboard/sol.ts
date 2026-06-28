function minSteps(n: number): number {
  if (n === 1) return 0;
  const dp: number[] = new Array(n + 1).fill(0);
  for (let i = 2; i <= n; i++) {
    dp[i] = i;
    for (let j = i - 1; j >= 1; j--) {
      if (i % j === 0) {
        dp[i] = dp[j] + Math.floor(i / j);
        break;
      }
    }
  }
  return dp[n];
}
