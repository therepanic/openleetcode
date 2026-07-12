function gridIllumination(
  n: number,
  lamps: number[][],
  queries: number[][],
): number[] {
  const rowCount: Map<number, number> = new Map();
  const colCount: Map<number, number> = new Map();
  const diag1: Map<number, number> = new Map();
  const diag2: Map<number, number> = new Map();
  const lampSet: Set<string> = new Set();
  const ans: number[] = new Array(queries.length);
  const dirs: [number, number][] = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 0],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1],
  ];

  for (const [r, c] of lamps) {
    const key = `${r},${c}`;
    if (!lampSet.has(key)) {
      lampSet.add(key);
      rowCount.set(r, (rowCount.get(r) || 0) + 1);
      colCount.set(c, (colCount.get(c) || 0) + 1);
      diag1.set(r - c, (diag1.get(r - c) || 0) + 1);
      diag2.set(r + c, (diag2.get(r + c) || 0) + 1);
    }
  }

  for (let i = 0; i < queries.length; i++) {
    const [r, c] = queries[i];
    if (
      (rowCount.get(r) || 0) > 0 ||
      (colCount.get(c) || 0) > 0 ||
      (diag1.get(r - c) || 0) > 0 ||
      (diag2.get(r + c) || 0) > 0
    ) {
      ans[i] = 1;
      for (const [dr, dc] of dirs) {
        const nr = r + dr,
          nc = c + dc;
        const key = `${nr},${nc}`;
        if (lampSet.has(key)) {
          lampSet.delete(key);
          rowCount.set(nr, rowCount.get(nr)! - 1);
          colCount.set(nc, colCount.get(nc)! - 1);
          diag1.set(nr - nc, diag1.get(nr - nc)! - 1);
          diag2.set(nr + nc, diag2.get(nr + nc)! - 1);
        }
      }
    } else {
      ans[i] = 0;
    }
  }
  return ans;
}
