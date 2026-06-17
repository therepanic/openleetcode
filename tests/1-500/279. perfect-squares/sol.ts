function numSquares(n: number): number {
  const dp = new Array(n + 1).fill(Infinity);
  dp[0] = 0;

  for (let i = 1; i <= n; i++) {
    let j = 1;
    while (j * j <= i) {
      dp[i] = Math.min(dp[i], dp[i - j * j] + 1);
      j++;
    }
  }

  return dp[n];
}
