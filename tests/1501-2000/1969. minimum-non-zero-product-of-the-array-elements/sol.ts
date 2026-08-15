function minNonZeroProduct(p: number): number {
  const MOD = 1000000007n;
  const maxNum = (1n << BigInt(p)) - 1n;
  const count = (1n << BigInt(p - 1)) - 1n;

  const powMod = (x: bigint, n: bigint): bigint => {
    let base = x % MOD;
    let exp = n;
    let result = 1n;
    while (exp > 0) {
      if (exp & 1n) {
        result = (result * base) % BigInt(MOD);
      }
      base = (base * base) % MOD;
      exp >>= 1n;
    }
    return result;
  };

  return Number((powMod(maxNum - 1n, count) * (maxNum % MOD)) % MOD);
}
