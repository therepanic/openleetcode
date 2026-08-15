function countSubIslands(grid1: number[][], grid2: number[][]): number {
  const m = grid1.length,
    n = grid1[0].length;
  let valid: boolean;

  function dfs(i: number, j: number): void {
    if (i < 0 || i >= m || j < 0 || j >= n) return;
    if (grid2[i][j] === 0) return;
    if (grid1[i][j] === 0) valid = false;
    grid2[i][j] = 0;
    dfs(i + 1, j);
    dfs(i - 1, j);
    dfs(i, j + 1);
    dfs(i, j - 1);
  }

  let res = 0;
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid2[i][j] === 1) {
        valid = true;
        dfs(i, j);
        if (valid) res++;
      }
    }
  }
  return res;
}
