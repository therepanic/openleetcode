function uniquePathsIII(grid: number[][]): number {
  const m = grid.length,
    n = grid[0].length;
  let sx = -1,
    sy = -1;
  let count = 0;
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] === 0) count++;
      if (grid[i][j] === 1) {
        sx = i;
        sy = j;
      }
    }
  }

  const backtrack = (i: number, j: number, count: number): number => {
    let result = 0;
    const dirs = [
      [i - 1, j],
      [i + 1, j],
      [i, j - 1],
      [i, j + 1],
    ];
    for (const [x, y] of dirs) {
      if (x < 0 || x >= m || y < 0 || y >= n) continue;
      if (grid[x][y] === 2) {
        if (count === 0) result++;
      } else if (grid[x][y] === 0) {
        grid[x][y] = -1;
        result += backtrack(x, y, count - 1);
        grid[x][y] = 0;
      }
    }
    return result;
  };

  return backtrack(sx, sy, count);
}
