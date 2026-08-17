function restoreMatrix(rowSum: number[], colSum: number[]): number[][] {
  const m = rowSum.length,
    n = colSum.length;
  const matrix: number[][] = Array.from({ length: m }, () =>
    new Array(n).fill(0),
  );
  let i = 0,
    j = 0;
  while (i < m && j < n) {
    const val = Math.min(rowSum[i], colSum[j]);
    matrix[i][j] = val;
    rowSum[i] -= val;
    colSum[j] -= val;
    if (rowSum[i] === 0) i++;
    if (colSum[j] === 0) j++;
  }
  return matrix;
}
