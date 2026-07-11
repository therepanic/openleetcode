function projectionArea(grid: number[][]): number {
  let xyArea = 0;
  let yzArea = 0;
  let zxArea = 0;
  const rows = grid.length;
  const cols = grid[0].length;
  for (let i = 0; i < rows; i++) {
    let maxRow = 0;
    for (let j = 0; j < cols; j++) {
      if (grid[i][j] > 0) xyArea++;
      if (grid[i][j] > maxRow) maxRow = grid[i][j];
    }
    yzArea += maxRow;
  }
  for (let j = 0; j < cols; j++) {
    let maxCol = 0;
    for (let i = 0; i < rows; i++) {
      if (grid[i][j] > maxCol) maxCol = grid[i][j];
    }
    zxArea += maxCol;
  }
  return xyArea + yzArea + zxArea;
}
