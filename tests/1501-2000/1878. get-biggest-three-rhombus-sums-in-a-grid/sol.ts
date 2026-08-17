function getBiggestThree(grid: number[][]): number[] {
  const m = grid.length;
  const n = grid[0].length;
  const maxD = Math.min(m, n) >> 1;
  let result: number[] = [];
  for (let d = 0; d <= maxD; d++) {
    for (let i = d; i < m - d; i++) {
      for (let j = d; j < n - d; j++) {
        const val = diamondSum(grid, i, j, d);
        if (!result.includes(val)) {
          result.push(val);
        }
      }
    }
  }
  result.sort((a, b) => b - a);
  return result.slice(0, 3);
}

function diamondSum(grid: number[][], i: number, j: number, d: number): number {
  if (d === 0) return grid[i][j];
  let sum = 0;
  for (let t = 0; t <= d; t++) sum += grid[i - d + t][j + t];
  for (let t = 1; t <= d; t++) sum += grid[i + t][j + d - t];
  for (let t = 1; t <= d; t++) sum += grid[i + d - t][j - t];
  for (let t = 1; t < d; t++) sum += grid[i - t][j - d + t];
  return sum;
}
