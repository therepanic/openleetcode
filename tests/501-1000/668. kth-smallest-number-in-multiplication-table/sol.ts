function findKthNumber(m: number, n: number, k: number): number {
  let lo = 1,
    hi = m * n;
  while (lo < hi) {
    const mid = lo + Math.floor((hi - lo) / 2);
    let count = 0;
    for (let i = 1; i <= m; i++) {
      count += n < Math.floor(mid / i) ? n : Math.floor(mid / i);
    }
    if (count >= k) {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }
  return lo;
}
