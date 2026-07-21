function maxSizeSlices(slices: number[]): number {
  const n = slices.length;
  const m = Math.floor(n / 3);

  function dp(slicesSubset: number[]): number {
    const k = slicesSubset.length;
    const dpTable: number[][] = Array.from({ length: k + 1 }, () =>
      Array(m + 1).fill(0),
    );
    for (let i = 1; i <= k; i++) {
      for (let j = 1; j <= Math.min(i, m); j++) {
        dpTable[i][j] = Math.max(
          dpTable[i - 1][j],
          (i > 1 ? dpTable[i - 2][j - 1] : 0) + slicesSubset[i - 1],
        );
      }
    }
    return dpTable[k][m];
  }

  return Math.max(dp(slices.slice(0, -1)), dp(slices.slice(1)));
}
