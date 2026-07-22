function closedIsland(grid: number[][]): number {
  const m = grid.length,
    n = grid[0].length;
  let res = 0;
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] === 1) continue;
      const stack: [number, number][] = [[i, j]];
      grid[i][j] = 1;
      let closed = true;
      while (stack.length > 0) {
        const [r, c] = stack.pop()!;
        if (r === 0 || c === 0 || r === m - 1 || c === n - 1) {
          closed = false;
        }
        const dirs: [number, number][] = [
          [1, 0],
          [-1, 0],
          [0, 1],
          [0, -1],
        ];
        for (const [dr, dc] of dirs) {
          const nr = r + dr,
            nc = c + dc;
          if (nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] === 0) {
            grid[nr][nc] = 1;
            stack.push([nr, nc]);
          }
        }
      }
      if (closed) res++;
    }
  }
  return res;
}
