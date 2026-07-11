function matrixScore(grid: number[][]): number {
  const rows = grid.length;
  const cols = grid[0].length;
  for (const row of grid) {
    if (row[0] === 0) {
      for (let i = 0; i < cols; i++) {
        row[i] ^= 1;
      }
    }
  }
  for (let j = 1; j < cols; j++) {
    let temp = 0;
    for (let i = 0; i < rows; i++) {
      temp += grid[i][j];
    }
    if (2 * temp < rows) {
      for (let i = 0; i < rows; i++) {
        grid[i][j] ^= 1;
      }
    }
  }
  let ans = 0;
  for (const row of grid) {
    let val = 0;
    for (const bit of row) {
      val = (val << 1) | bit;
    }
    ans += val;
  }
  return ans;
}
