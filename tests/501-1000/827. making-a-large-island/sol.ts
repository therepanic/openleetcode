function largestIsland(grid: number[][]): number {
  const r = grid.length;
  const c = grid[0].length;
  const dirs = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1],
  ];
  let island = 2;
  const a = new Map<number, number>();

  function dfs(i: number, j: number, x: number): number {
    let tot = 1;
    grid[i][j] = x;
    for (const [dx, dy] of dirs) {
      const nx = i + dx;
      const ny = j + dy;
      if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] === 1) {
        tot += dfs(nx, ny, x);
      }
    }
    return tot;
  }

  for (let i = 0; i < r; i++) {
    for (let j = 0; j < c; j++) {
      if (grid[i][j] === 1) {
        a.set(island, dfs(i, j, island));
        island++;
      }
    }
  }

  let res = 0;
  for (let i = 0; i < r; i++) {
    for (let j = 0; j < c; j++) {
      if (grid[i][j] === 0) {
        const y = new Set<number>();
        for (const [dx, dy] of dirs) {
          const nx = i + dx;
          const ny = j + dy;
          if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] !== 0) {
            y.add(grid[nx][ny]);
          }
        }
        let tot = 1;
        for (const b of y) {
          tot += a.get(b) ?? 0;
        }
        res = Math.max(res, tot);
      }
    }
  }

  return Math.max(res, a.get(2) ?? 0);
}
