function findPaths(
  m: number,
  n: number,
  maxMove: number,
  startRow: number,
  startColumn: number,
): number {
  const MOD = 1000000007;
  const dp: number[][][] = Array.from({ length: maxMove + 1 }, () =>
    Array.from({ length: m }, () => Array(n).fill(0)),
  );
  const directions = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
  ];

  for (let move = 1; move <= maxMove; move++) {
    for (let i = 0; i < m; i++) {
      for (let j = 0; j < n; j++) {
        for (const [dx, dy] of directions) {
          const x = i + dx;
          const y = j + dy;
          if (x < 0 || x >= m || y < 0 || y >= n) {
            dp[move][i][j] = (dp[move][i][j] + 1) % MOD;
          } else {
            dp[move][i][j] = (dp[move][i][j] + dp[move - 1][x][y]) % MOD;
          }
        }
      }
    }
  }

  return dp[maxMove][startRow][startColumn];
}
