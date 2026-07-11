function transpose(matrix: number[][]): number[][] {
  const row = matrix.length;
  const col = matrix[0].length;
  const trans: number[][] = Array.from({ length: col }, () =>
    Array(row).fill(0),
  );

  for (let i = 0; i < col; i++) {
    for (let j = 0; j < row; j++) {
      trans[i][j] = matrix[j][i];
    }
  }

  return trans;
}
