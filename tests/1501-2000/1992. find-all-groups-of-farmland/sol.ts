function findFarmland(land: number[][]): number[][] {
  const n = land.length;
  const m = land[0].length;
  const visited: boolean[][] = Array.from({ length: n }, () =>
    Array(m).fill(false),
  );
  const directions = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1],
  ];

  const maxr: number[] = [0];
  const maxc: number[] = [0];

  const dfs = (r: number, c: number): void => {
    visited[r][c] = true;
    maxr[0] = Math.max(maxr[0], r);
    maxc[0] = Math.max(maxc[0], c);
    for (const d of directions) {
      const nr = r + d[0];
      const nc = c + d[1];
      if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
        if (!visited[nr][nc] && land[nr][nc] === 1) {
          dfs(nr, nc);
        }
      }
    }
  };

  const res: number[][] = [];
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      if (land[i][j] === 1 && !visited[i][j]) {
        maxr[0] = i;
        maxc[0] = j;
        dfs(i, j);
        res.push([i, j, maxr[0], maxc[0]]);
      }
    }
  }
  return res;
}
