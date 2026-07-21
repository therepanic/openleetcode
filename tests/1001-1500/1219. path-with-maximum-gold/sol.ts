function getMaximumGold(grid: number[][]): number {
  const n = grid.length;
  const m = grid[0].length;

  const visited: boolean[][] = Array.from({ length: n }, () =>
    Array(m).fill(false),
  );
  const directions: number[][] = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1],
  ];

  const dfs = (r: number, c: number): number => {
    let total = grid[r][c];
    visited[r][c] = true;

    let curr = 0;
    for (const [dr, dc] of directions) {
      const nr = r + dr;
      const nc = c + dc;
      if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
        if (grid[nr][nc] !== 0 && !visited[nr][nc]) {
          const a = dfs(nr, nc);
          curr = Math.max(curr, a);
        }
      }
    }
    total += curr;
    visited[r][c] = false;
    return total;
  };

  let ans = 0;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      if (!visited[i][j] && grid[i][j] !== 0) {
        ans = Math.max(ans, dfs(i, j));
      }
    }
  }
  return ans;
}
