function numOfWays(n: number): number {
  const MOD = 1000000007;
  let x = 6,
    y = 6;

  for (let i = 2; i <= n; i++) {
    let newX = (3 * x + 2 * y) % MOD;
    let newY = (2 * x + 2 * y) % MOD;
    x = newX;
    y = newY;
  }

  return (x + y) % MOD;
}
