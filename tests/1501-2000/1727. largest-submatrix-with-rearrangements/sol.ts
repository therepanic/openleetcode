function largestSubmatrix(matrix: number[][]): number {
  const m = matrix.length;
  const n = matrix[0].length;
  let maxArea = 0;
  const h: number[] = new Array(n).fill(0);
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (j < matrix[i].length && matrix[i][j] === 1) {
        h[j]++;
      } else {
        h[j] = 0;
      }
    }
    const sh = [...h].sort((a, b) => b - a);
    for (let j = 0; j < n; j++) {
      if (sh[j] === 0) break;
      maxArea = Math.max(maxArea, sh[j] * (j + 1));
    }
  }
  return maxArea;
}
