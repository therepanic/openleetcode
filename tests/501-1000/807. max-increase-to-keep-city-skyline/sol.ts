function maxIncreaseKeepingSkyline(grid: number[][]): number {
  const n = grid.length;
  const rowMax: number[] = new Array(n);
  const colMax: number[] = new Array(n);
  for (let r = 0; r < n; r++) {
    rowMax[r] = Math.max(...grid[r]);
  }
  for (let c = 0; c < n; c++) {
    let maxVal = 0;
    for (let r = 0; r < n; r++) {
      maxVal = Math.max(maxVal, grid[r][c]);
    }
    colMax[c] = maxVal;
  }
  let gain = 0;
  for (let r = 0; r < n; r++) {
    for (let c = 0; c < n; c++) {
      gain += Math.min(rowMax[r], colMax[c]) - grid[r][c];
    }
  }
  return gain;
}
