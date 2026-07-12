function tallestBillboard(rods: number[]): number {
  const n = rods.length;
  const mid = (n - 1) >> 1;

  const left: [number, number][] = [];
  const right: [number, number][] = [];

  function gen(
    idx: number,
    end: number,
    a: number,
    b: number,
    vals: [number, number][],
  ): void {
    if (idx === end + 1) {
      vals.push([a - b, b]);
      return;
    }
    gen(idx + 1, end, a, b, vals);
    gen(idx + 1, end, a + rods[idx], b, vals);
    gen(idx + 1, end, a, b + rods[idx], vals);
  }

  gen(0, mid, 0, 0, left);
  gen(mid + 1, n - 1, 0, 0, right);

  left.sort((a, b) => (a[0] !== b[0] ? a[0] - b[0] : b[1] - a[1]));
  right.sort((a, b) => (a[0] !== b[0] ? a[0] - b[0] : b[1] - a[1]));

  let ans = 0;
  const rightDiffs = right.map((r) => r[0]);
  const rightHeights = right.map((r) => r[1]);

  for (const [d, b] of left) {
    const target = -d;
    let lo = 0,
      hi = rightDiffs.length;
    while (lo < hi) {
      const m = (lo + hi) >> 1;
      if (rightDiffs[m] < target) lo = m + 1;
      else hi = m;
    }
    if (lo < rightDiffs.length && rightDiffs[lo] === target) {
      ans = Math.max(ans, b + rightHeights[lo]);
    }
  }
  return ans;
}
