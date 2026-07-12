function maxEqualRowsAfterFlips(matrix: number[][]): number {
  const count: Map<string, number> = new Map();
  let ans = 0;

  for (const row of matrix) {
    const flip = row[0];
    const key = row.map((x) => (x ^ flip).toString()).join(",");
    const val = (count.get(key) ?? 0) + 1;
    count.set(key, val);
    if (val > ans) ans = val;
  }

  return ans;
}
