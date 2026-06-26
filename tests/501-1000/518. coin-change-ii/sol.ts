function change(amount: number, coins: number[]): number {
  const n = coins.length;
  const dp: number[][] = Array.from({ length: n + 1 }, () =>
    Array(amount + 1).fill(0),
  );

  for (let i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }

  for (let i = 1; i <= n; i++) {
    for (let j = 1; j <= amount; j++) {
      if (coins[i - 1] <= j) {
        dp[i][j] = dp[i][j - coins[i - 1]] + dp[i - 1][j];
      } else {
        dp[i][j] = dp[i - 1][j];
      }
    }
  }

  return dp[n][amount];
}
