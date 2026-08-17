function diagonalSum(mat: number[][]): number {
  let summ = 0;
  const n = mat.length;
  for (let i = 0; i < n; i++) {
    summ += mat[i][i];
    summ += mat[i][n - 1 - i];
  }
  if (n % 2 === 1) {
    summ -= mat[Math.floor(n / 2)][Math.floor(n / 2)];
  }
  return summ;
}
