function numTilings(n: number): number {
  const MOD = 1_000_000_007;
  if (n === 0) return 1;
  if (n === 1) return 1;
  if (n === 2) return 2;
  let a = 1; // dp[i - 3]
  let b = 2; // dp[i - 2]
  let c = 5; // dp[i - 1]
  for (let i = 4; i <= n; i++) {
    const next = (2 * c + a) % MOD;
    a = b;
    b = c;
    c = next;
  }
  return c;
}
