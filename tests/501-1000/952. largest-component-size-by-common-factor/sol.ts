function largestComponentSize(nums: number[]): number {
  const n = nums.length;
  const root = Array.from({ length: n }, (_, i) => i);
  const rank = Array(n).fill(1);

  function find(x: number): number {
    while (root[x] !== x) {
      root[x] = root[root[x]];
      x = root[x];
    }
    return x;
  }

  function union(x: number, y: number): void {
    const rx = find(x);
    const ry = find(y);
    if (rx === ry) return;
    if (rank[rx] > rank[ry]) {
      root[ry] = rx;
    } else if (rank[rx] < rank[ry]) {
      root[rx] = ry;
    } else {
      root[ry] = rx;
      rank[rx]++;
    }
  }

  function getPrimeFactors(num: number): number[] {
    const res: number[] = [];
    let n = num;
    if (n % 2 === 0) {
      res.push(2);
      while (n % 2 === 0) n = Math.floor(n / 2);
    }
    for (let i = 3; i * i <= n; i += 2) {
      if (n % i === 0) {
        res.push(i);
        while (n % i === 0) n = Math.floor(n / i);
      }
    }
    if (n > 2) res.push(n);
    return res;
  }

  const primeToIdx = new Map<number, number>();
  for (let i = 0; i < n; i++) {
    const primes = getPrimeFactors(nums[i]);
    for (const p of primes) {
      if (primeToIdx.has(p)) {
        union(primeToIdx.get(p)!, i);
      }
      primeToIdx.set(p, i);
    }
  }

  const count = new Map<number, number>();
  let maxSize = 0;
  for (let i = 0; i < n; i++) {
    const r = find(i);
    const c = (count.get(r) || 0) + 1;
    count.set(r, c);
    if (c > maxSize) maxSize = c;
  }
  return maxSize;
}
