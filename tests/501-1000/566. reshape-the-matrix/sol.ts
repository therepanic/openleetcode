function matrixReshape(mat: number[][], r: number, c: number): number[][] {
  const m = mat.length;
  const n = mat[0].length;
  if (m * n !== r * c) {
    return mat;
  }

  const reshaped: number[][] = Array.from({ length: r }, () =>
    Array(c).fill(0),
  );
  let count = 0;

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      reshaped[Math.floor(count / c)][count % c] = mat[i][j];
      count++;
    }
  }

  return reshaped;
}
