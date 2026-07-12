function shortestBridge(grid: number[][]): number {
  const n = grid.length;
  const directions: [number, number][] = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1],
  ];
  const visited: boolean[][] = Array.from({ length: n }, () =>
    Array(n).fill(false),
  );
  const q: [number, number, number][] = [];

  function dfs(r: number, c: number): void {
    visited[r][c] = true;
    for (const [dr, dc] of directions) {
      const nr = r + dr;
      const nc = c + dc;
      if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
        if (grid[nr][nc] === 0) {
          visited[nr][nc] = true;
          q.push([nr, nc, 1]);
        } else {
          dfs(nr, nc);
        }
      }
    }
  }

  let found = false;
  for (let i = 0; i < n && !found; i++) {
    for (let j = 0; j < n && !found; j++) {
      if (grid[i][j] === 1) {
        dfs(i, j);
        found = true;
      }
    }
  }

  while (q.length > 0) {
    const [r, c, dist] = q.shift()!;
    for (const [dr, dc] of directions) {
      const nr = r + dr;
      const nc = c + dc;
      if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
        if (grid[nr][nc] === 1) return dist;
        visited[nr][nc] = true;
        q.push([nr, nc, dist + 1]);
      }
    }
  }
  return 0;
}
