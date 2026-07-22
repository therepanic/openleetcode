function matrixBlockSum(mat: number[][], k: number): number[][] {
  const n = mat.length,
    m = mat[0].length;
  const pre: number[][] = Array.from({ length: n }, () => Array(m).fill(0));
  const ans: number[][] = Array.from({ length: n }, () => Array(m).fill(0));

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      let sum = mat[i][j];
      if (i - 1 >= 0) sum += pre[i - 1][j];
      if (j - 1 >= 0) sum += pre[i][j - 1];
      if (i - 1 >= 0 && j - 1 >= 0) sum -= pre[i - 1][j - 1];
      pre[i][j] = sum;
    }
  }

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      const i1 = Math.max(0, i - k);
      const i2 = Math.min(n - 1, i + k);
      const j1 = Math.max(0, j - k);
      const j2 = Math.min(m - 1, j + k);
      let sum = pre[i2][j2];
      if (i1 - 1 >= 0) sum -= pre[i1 - 1][j2];
      if (j1 - 1 >= 0) sum -= pre[i2][j1 - 1];
      if (i1 - 1 >= 0 && j1 - 1 >= 0) sum += pre[i1 - 1][j1 - 1];
      ans[i][j] = sum;
    }
  }
  return ans;
}
