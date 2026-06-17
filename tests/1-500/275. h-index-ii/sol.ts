function hIndex(citations: number[]): number {
  const n = citations.length;
  let l = 0,
    r = n;
  while (l < r) {
    const m = Math.floor((l + r + 1) / 2);
    if (citations[n - m] >= m) {
      l = m;
    } else {
      r = m - 1;
    }
  }
  return l;
}
