function regionsBySlashes(grid: string[]): number {
  const n = grid.length;
  const parents: number[] = Array.from({ length: 4 * n * n }, (_, i) => i);
  let count = 4 * n * n;

  function find(x: number): number {
    if (x !== parents[x]) {
      parents[x] = find(parents[x]);
    }
    return parents[x];
  }

  function union(x: number, y: number): boolean {
    const rx = find(x);
    const ry = find(y);
    if (rx !== ry) {
      parents[rx] = ry;
      return true;
    }
    return false;
  }

  const merges: Record<string, [number, number][]> = {
    " ": [
      [0, 1],
      [1, 2],
      [2, 3],
    ],
    "/": [
      [0, 3],
      [1, 2],
    ],
    "\\": [
      [0, 1],
      [2, 3],
    ],
  };

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      const base = (i * n + j) * 4;
      for (const [u, v] of merges[grid[i][j]]) {
        if (union(base + u, base + v)) {
          count--;
        }
      }

      if (i + 1 < n) {
        const downBase = ((i + 1) * n + j) * 4;
        if (union(base + 2, downBase)) {
          count--;
        }
      }

      if (j + 1 < n) {
        const rightBase = (i * n + (j + 1)) * 4;
        if (union(base + 1, rightBase + 3)) {
          count--;
        }
      }
    }
  }
  return count;
}
