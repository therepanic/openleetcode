function knightProbability(
  n: number,
  k: number,
  row: number,
  column: number,
): number {
  if (k === 0) return 1.0;

  const moves: [number, number][] = [
    [1, 2],
    [2, 1],
    [2, -1],
    [1, -2],
    [-1, -2],
    [-2, -1],
    [-2, 1],
    [-1, 2],
  ];

  let dp: number[][] = Array.from({ length: n }, () => Array(n).fill(0.0));
  dp[row][column] = 1.0;

  for (let step = 0; step < k; step++) {
    const nextDp: number[][] = Array.from({ length: n }, () =>
      Array(n).fill(0.0),
    );
    for (let r = 0; r < n; r++) {
      for (let c = 0; c < n; c++) {
        if (dp[r][c] === 0.0) continue;
        for (const [dr, dc] of moves) {
          const nr = r + dr;
          const nc = c + dc;
          if (nr >= 0 && nr < n && nc >= 0 && nc < n) {
            nextDp[nr][nc] += dp[r][c] / 8.0;
          }
        }
      }
    }
    dp = nextDp;
  }

  let total = 0.0;
  for (let r = 0; r < n; r++) {
    for (let c = 0; c < n; c++) {
      total += dp[r][c];
    }
  }
  return total;
}
