function countServers(grid: number[][]): number {
  const m = grid.length;
  const n = grid[0].length;
  const rowCounts: number[] = new Array(m).fill(0);
  const colCounts: number[] = new Array(n).fill(0);
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] === 1) {
        rowCounts[i]++;
        colCounts[j]++;
      }
    }
  }
  let result = 0;
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] === 1 && (rowCounts[i] > 1 || colCounts[j] > 1)) {
        result++;
      }
    }
  }
  return result;
}
