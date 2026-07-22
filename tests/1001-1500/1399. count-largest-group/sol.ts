function countLargestGroup(n: number): number {
  const mpp: Map<number, number> = new Map();
  let maxi = 0;
  let count = 0;

  for (let i = 1; i <= n; i++) {
    const x = digsum(i);
    mpp.set(x, (mpp.get(x) || 0) + 1);
    maxi = Math.max(maxi, mpp.get(x)!);
  }

  for (const v of mpp.values()) {
    if (v === maxi) {
      count++;
    }
  }
  return count;
}

function digsum(n: number): number {
  let s = 0;
  while (n > 0) {
    s += n % 10;
    n = Math.floor(n / 10);
  }
  return s;
}
