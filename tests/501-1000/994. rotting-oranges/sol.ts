function orangesRotting(grid: number[][]): number {
  const n = grid.length,
    m = grid[0].length;
  const q: [number, number, number][] = [];
  let fresh = 0;

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      if (grid[i][j] === 2) {
        q.push([i, j, 0]);
      } else if (grid[i][j] === 1) {
        fresh++;
      }
    }
  }

  const directions = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
  ];
  let maxTime = 0,
    rotten = 0;

  while (q.length > 0) {
    const [r, c, t] = q.shift()!;
    if (t > maxTime) maxTime = t;

    for (const [dr, dc] of directions) {
      const nr = r + dr,
        nc = c + dc;
      if (nr >= 0 && nr < n && nc >= 0 && nc < m && grid[nr][nc] === 1) {
        grid[nr][nc] = 2;
        q.push([nr, nc, t + 1]);
        rotten++;
      }
    }
  }

  return rotten === fresh ? maxTime : -1;
}
