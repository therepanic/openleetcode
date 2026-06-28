function cherryPickup(grid: number[][]): number {
  const n = grid.length;

  let dp: number[][] = Array.from({ length: n }, () =>
    Array(n).fill(-Infinity),
  );
  dp[0][0] = 0;

  for (let k = 0; k <= 2 * (n - 1); k++) {
    const newDp: number[][] = Array.from({ length: n }, () =>
      Array(n).fill(-Infinity),
    );

    for (let x1 = 0; x1 < n; x1++) {
      const y1 = k - x1;
      if (!(y1 >= 0 && y1 < n)) continue;

      for (let x2 = 0; x2 < n; x2++) {
        const y2 = k - x2;
        if (!(y2 >= 0 && y2 < n)) continue;

        if (grid[x1][y1] === -1 || grid[x2][y2] === -1) continue;

        let best = dp[x1][x2];
        if (x1 > 0) best = Math.max(best, dp[x1 - 1][x2]);
        if (x2 > 0) best = Math.max(best, dp[x1][x2 - 1]);
        if (x1 > 0 && x2 > 0) best = Math.max(best, dp[x1 - 1][x2 - 1]);

        if (best === -Infinity) continue;

        best += grid[x1][y1];
        if (x1 !== x2) best += grid[x2][y2];

        newDp[x1][x2] = best;
      }
    }

    dp = newDp;
  }

  return Math.max(0, dp[n - 1][n - 1]);
}
