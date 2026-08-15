function maxBuilding(n: number, restrictions: number[][]): number {
  let r: number[][] = restrictions.slice();
  r.push([1, 0]);
  r.sort((a, b) => a[0] - b[0]);
  const m = r.length;

  for (let i = 1; i < m; i++) {
    r[i][1] = Math.min(r[i][1], r[i - 1][1] + Math.abs(r[i][0] - r[i - 1][0]));
  }

  for (let i = m - 2; i >= 0; i--) {
    r[i][1] = Math.min(r[i][1], r[i + 1][1] + Math.abs(r[i + 1][0] - r[i][0]));
  }

  let res = 0;
  for (let i = 1; i < m; i++) {
    const peak = Math.floor(
      (r[i - 1][1] + r[i][1] + r[i][0] - r[i - 1][0]) / 2,
    );
    res = Math.max(res, peak);
  }

  return Math.max(res, r[m - 1][1] + n - r[m - 1][0]);
}
