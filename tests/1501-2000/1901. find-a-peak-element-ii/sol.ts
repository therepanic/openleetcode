function findPeakGrid(mat: number[][]): number[] {
  const n = mat.length;
  const m = mat[0].length;

  let low = 0,
    high = m - 1;

  while (low <= high) {
    const mid = low + Math.floor((high - low) / 2);

    let maxRow = 0;
    for (let i = 1; i < n; i++) {
      if (mat[i][mid] > mat[maxRow][mid]) {
        maxRow = i;
      }
    }

    const left = mid > 0 ? mat[maxRow][mid - 1] : -1;
    const right = mid < m - 1 ? mat[maxRow][mid + 1] : -1;

    if (mat[maxRow][mid] > left && mat[maxRow][mid] > right) {
      return [maxRow, mid];
    }

    if (mat[maxRow][mid] < left) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }

  return [-1, -1];
}
