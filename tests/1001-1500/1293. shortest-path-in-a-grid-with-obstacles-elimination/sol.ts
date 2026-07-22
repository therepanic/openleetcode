function shortestPath(grid: number[][], k: number): number {
  const n = grid.length,
    m = grid[0].length;
  const q: [number, number, number, number][] = [[0, 0, k, 0]];
  const visi = new Set<string>();
  visi.add("0,0," + k);
  const dirs = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1],
  ];
  while (q.length > 0) {
    const [r, c, kRem, d] = q.shift()!;
    if (r === n - 1 && c === m - 1) return d;
    let newK = grid[r][c] === 1 ? kRem - 1 : kRem;
    for (const [dr, dc] of dirs) {
      const nr = r + dr,
        nc = c + dc;
      if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
        const key = nr + "," + nc + "," + newK;
        if (!visi.has(key) && newK >= 0) {
          visi.add(key);
          q.push([nr, nc, newK, d + 1]);
        }
      }
    }
  }
  return -1;
}
