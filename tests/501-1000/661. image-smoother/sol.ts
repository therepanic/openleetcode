function imageSmoother(img: number[][]): number[][] {
  const m = img.length;
  const n = img[0].length;
  const P: number[][] = Array.from({ length: m + 1 }, () =>
    Array(n + 1).fill(0),
  );
  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      P[i][j] = img[i - 1][j - 1] + P[i - 1][j] + P[i][j - 1] - P[i - 1][j - 1];
    }
  }
  const res: number[][] = Array.from({ length: m }, () => Array(n).fill(0));
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      const a = Math.max(0, i - 1);
      const b = Math.max(0, j - 1);
      const c = Math.min(m - 1, i + 1);
      const d = Math.min(n - 1, j + 1);
      const s = P[c + 1][d + 1] - P[a][d + 1] - P[c + 1][b] + P[a][b];
      res[i][j] = Math.floor(s / ((c - a + 1) * (d - b + 1)));
    }
  }
  return res;
}
