function countSquares(matrix: number[][]): number {
  if (!matrix || matrix.length === 0 || matrix[0].length === 0) {
    return 0;
  }

  const m = matrix.length;
  const n = matrix[0].length;
  let res = 0;

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (matrix[i][j] === 1 && i > 0 && j > 0) {
        matrix[i][j] =
          Math.min(matrix[i - 1][j], matrix[i][j - 1], matrix[i - 1][j - 1]) +
          1;
      }
      res += matrix[i][j];
    }
  }

  return res;
}
