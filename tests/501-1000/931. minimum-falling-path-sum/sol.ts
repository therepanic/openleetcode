function minFallingPathSum(matrix: number[][]): number {
  const m = matrix.length;
  const n = matrix[0].length;
  if (m === 1 && n === 1) {
    return Math.min(...matrix[0]);
  }
  const dp: (number | null)[][] = Array.from({ length: m - 1 }, () =>
    Array(n).fill(null),
  );
  let mini = Infinity;
  const f = (i: number, j: number): number => {
    if (j >= n || j < 0) return Infinity;
    if (i === m - 1) return matrix[i][j];
    if (dp[i][j] !== null) return dp[i][j]!;
    const down = matrix[i][j] + f(i + 1, j);
    const leftd = matrix[i][j] + f(i + 1, j - 1);
    const rightd = matrix[i][j] + f(i + 1, j + 1);
    dp[i][j] = Math.min(down, leftd, rightd);
    return dp[i][j]!;
  };
  for (let i = 0; i < n; i++) {
    mini = Math.min(mini, f(0, i));
  }
  return mini;
}
