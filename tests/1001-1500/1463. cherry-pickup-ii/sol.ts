function cherryPickup(grid: number[][]): number {
  const m = grid.length;
  const n = grid[0].length;
  const dp: number[][][] = Array.from({ length: m }, () =>
    Array.from({ length: n }, () => Array(n).fill(-1)),
  );
  dp[0][0][n - 1] = grid[0][0] + grid[0][n - 1];

  for (let i = 1; i < m; i++) {
    for (let j = 0; j < n; j++) {
      for (let k = j + 1; k < n; k++) {
        for (let x = -1; x <= 1; x++) {
          for (let y = -1; y <= 1; y++) {
            const nj = j + x;
            const nk = k + y;
            if (nj >= 0 && nj < n && nk >= 0 && nk < n) {
              const prev = dp[i - 1][nj][nk];
              if (prev !== -1) {
                let add = grid[i][j];
                if (j !== k) add += grid[i][k];
                dp[i][j][k] = Math.max(dp[i][j][k], prev + add);
              }
            }
          }
        }
      }
    }
  }

  let ans = -1;
  for (const row of dp[m - 1]) {
    for (const v of row) {
      ans = Math.max(ans, v);
    }
  }
  return ans !== -1 ? ans : 0;
}
