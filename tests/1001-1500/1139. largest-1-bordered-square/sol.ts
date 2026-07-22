function largest1BorderedSquare(grid: number[][]): number {
  const m = grid.length,
    n = grid[0].length;
  const h: number[][] = Array.from({ length: m }, () => Array(n).fill(0));
  const v: number[][] = Array.from({ length: m }, () => Array(n).fill(0));
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] === 1) {
        h[i][j] = (j === 0 ? 0 : h[i][j - 1]) + 1;
        v[i][j] = (i === 0 ? 0 : v[i - 1][j]) + 1;
      }
    }
  }
  let ans = 0;
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      const sz = Math.min(h[i][j], v[i][j]);
      for (let k = sz; k >= 1; k--) {
        if (h[i - k + 1][j] >= k && v[i][j - k + 1] >= k) {
          ans = Math.max(ans, k);
          break;
        }
      }
    }
  }
  return ans * ans;
}
