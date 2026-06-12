function countPrimes(n: number): number {
  if (n <= 2) return 0;
  const isPrime = Array(n).fill(true);
  isPrime[0] = false;
  isPrime[1] = false;
  for (let i = 2; i * i < n; i++) {
    if (!isPrime[i]) continue;
    for (let j = i * i; j < n; j += i) isPrime[j] = false;
  }
  let ans = 0;
  for (const x of isPrime) if (x) ans++;
  return ans;
}
