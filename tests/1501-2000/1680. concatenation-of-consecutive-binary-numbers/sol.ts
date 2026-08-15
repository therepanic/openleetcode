function concatenatedBinary(n: number): number {
  const MOD = 1_000_000_007;
  let res = 0;
  let bits = 0;

  for (let i = 1; i <= n; i++) {
    if ((i & (i - 1)) === 0) {
      bits++;
    }
    res = (res * Math.pow(2, bits) + i) % MOD;
  }

  return res;
}
