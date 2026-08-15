function numberOfSets(n: number, k: number): number {
  const MOD = 1_000_000_007;
  let dpPrev: number[] = new Array(n).fill(1);

  let prefixPrev: number[] = new Array(n).fill(0);
  prefixPrev[0] = dpPrev[0];
  for (let i = 1; i < n; i++) {
    prefixPrev[i] = (prefixPrev[i - 1] + dpPrev[i]) % MOD;
  }

  for (let iter = 0; iter < k; iter++) {
    let dpCur: number[] = new Array(n).fill(0);
    for (let i = 1; i < n; i++) {
      dpCur[i] = (dpCur[i - 1] + prefixPrev[i - 1]) % MOD;
    }
    dpPrev = dpCur;
    prefixPrev[0] = dpPrev[0];
    for (let i = 1; i < n; i++) {
      prefixPrev[i] = (prefixPrev[i - 1] + dpPrev[i]) % MOD;
    }
  }

  return dpPrev[n - 1];
}
