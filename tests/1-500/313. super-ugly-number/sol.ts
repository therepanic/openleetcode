function nthSuperUglyNumber(n: number, primes: number[]): number {
  const ugly: number[] = new Array(n).fill(1);
  const idx: number[] = new Array(primes.length).fill(0);
  const val: number[] = [...primes];
  for (let i = 1; i < n; i++) {
    let m = val[0];
    for (let j = 1; j < val.length; j++) {
      if (val[j] < m) {
        m = val[j];
      }
    }
    ugly[i] = m;
    for (let j = 0; j < primes.length; j++) {
      if (val[j] === m) {
        idx[j]++;
        val[j] = ugly[idx[j]] * primes[j];
      }
    }
  }
  return ugly[n - 1];
}
