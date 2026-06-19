function smallestGoodBase(n: string): string {
  const nInt = BigInt(n);
  const maxM = nInt.toString(2).length - 1;

  for (let m = maxM; m >= 1; m--) {
    let left = 2n;
    let right = BigInt(Math.floor(Math.pow(Number(n), 1 / m)) + 1);
    while (left <= right) {
      const mid = left + (right - left) / 2n;
      const cmp = compareBase(mid, m, nInt);
      if (cmp === 0) {
        return mid.toString();
      }
      if (cmp < 0) {
        left = mid + 1n;
      } else {
        right = mid - 1n;
      }
    }
  }
  return (nInt - 1n).toString();
}

function compareBase(base: bigint, m: number, n: bigint): number {
  let sum = 1n;
  let cur = 1n;
  for (let i = 0; i < m; i++) {
    cur *= base;
    sum += cur;
    if (sum > n) {
      return 1;
    }
  }
  return sum === n ? 0 : -1;
}
