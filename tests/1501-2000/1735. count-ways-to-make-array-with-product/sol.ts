function waysToFillArray(queries: number[][]): number[] {
  const MOD = 1_000_000_007;

  function primeFactors(n: number): Map<number, number> {
    const map = new Map<number, number>();
    let p = 2;
    while (p * p <= n) {
      while (n % p === 0) {
        map.set(p, (map.get(p) || 0) + 1);
        n = Math.floor(n / p);
      }
      p++;
    }
    if (n > 1) map.set(n, (map.get(n) || 0) + 1);
    return map;
  }

  function pow(a: bigint, e: bigint): bigint {
    let result = 1n;
    while (e > 0n) {
      if (e % 2n === 1n) result = (result * a) % BigInt(MOD);
      a = (a * a) % BigInt(MOD);
      e = e / 2n;
    }
    return result;
  }
  function comb(n: number, r: number): number {
    r = Math.min(r, n - r);
    let result = 1n;
    for (let i = 1; i <= r; i++)
      result =
        (((result * BigInt(n - i + 1)) % BigInt(MOD)) *
          pow(BigInt(i), BigInt(MOD - 2))) %
        BigInt(MOD);
    return Number(result);
  }

  const result: number[] = [];
  for (const [n, k] of queries) {
    const factors = primeFactors(k);
    let total = 1n;
    for (const cnt of factors.values()) {
      total = (total * BigInt(comb(n + cnt - 1, n - 1))) % BigInt(MOD);
    }
    result.push(Number(total));
  }
  return result;
}
