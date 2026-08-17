function numSpecial(mat: number[][]): number {
  const m = mat.length,
    n = mat[0].length;
  const row: number[] = new Array(m).fill(0);
  const col: number[] = new Array(n).fill(0);

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (mat[i][j] === 1) {
        row[i]++;
        col[j]++;
      }
    }
  }

  let result = 0;
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (mat[i][j] === 1 && row[i] === 1 && col[j] === 1) {
        result++;
      }
    }
  }
  return result;
}
