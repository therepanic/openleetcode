function profitableSchemes(
  n: number,
  minProfit: number,
  group: number[],
  profit: number[],
): number {
  const mod = 1_000_000_007;
  const dp: number[][] = Array.from({ length: n + 1 }, () =>
    new Array(minProfit + 1).fill(0),
  );
  dp[0][0] = 1;
  for (let k = 1; k <= group.length; k++) {
    const g = group[k - 1];
    const p = profit[k - 1];
    for (let i = n; i >= g; i--) {
      for (let j = minProfit; j >= 0; j--) {
        const prev = j - p >= 0 ? dp[i - g][j - p] : dp[i - g][0];
        dp[i][j] = (dp[i][j] + prev) % mod;
      }
    }
  }
  let ans = 0;
  for (let i = 0; i <= n; i++) {
    ans = (ans + dp[i][minProfit]) % mod;
  }
  return ans;
}
