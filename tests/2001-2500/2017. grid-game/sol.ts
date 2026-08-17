function gridGame(grid: number[][]): number {
  let minResult = Number.MAX_SAFE_INTEGER;
  let row1Sum = grid[0].reduce((a, b) => a + b, 0);
  let row2Sum = 0;

  for (let i = 0; i < grid[0].length; i++) {
    row1Sum -= grid[0][i];
    minResult = Math.min(minResult, Math.max(row1Sum, row2Sum));
    row2Sum += grid[1][i];
  }

  return minResult;
}
