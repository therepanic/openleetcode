function numOfArrays(n: number, m: number, k: number): number {
  const MOD = 1_000_000_007;
  const dp: number[][][] = Array.from({ length: n + 1 }, () =>
    Array.from({ length: k + 1 }, () => Array(m + 1).fill(-1)),
  );

  function solve(idx: number, searchCost: number, maxValue: number): number {
    if (idx === n) return searchCost === k ? 1 : 0;
    if (searchCost > k) return 0;
    if (dp[idx][searchCost][maxValue] !== -1)
      return dp[idx][searchCost][maxValue];

    let result = 0;
    for (let i = 1; i <= m; i++) {
      if (i > maxValue) {
        result = (result + solve(idx + 1, searchCost + 1, i)) % MOD;
      } else {
        result = (result + solve(idx + 1, searchCost, maxValue)) % MOD;
      }
    }

    dp[idx][searchCost][maxValue] = result;
    return result;
  }

  return solve(0, 0, 0);
}
