function countOrders(n: number): number {
  const MOD = 1000000007;
  let count = 1;
  for (let i = 2; i <= n; i++) {
    count = (count * (2 * i - 1) * i) % MOD;
  }
  return count;
}
