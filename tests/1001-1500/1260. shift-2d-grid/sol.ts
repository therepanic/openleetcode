function shiftGrid(grid: number[][], k: number): number[][] {
  const m = grid.length;
  const n = grid[0].length;
  const total = m * n;
  k %= total;
  if (k === 0) {
    return grid;
  }

  const lastKElements: number[] = new Array(k);
  let i = m - 1;
  let x = n - 1;
  let count = 0;

  while (count !== k) {
    lastKElements[count] = grid[i][x];
    if (x >= 1) {
      x--;
    } else {
      i--;
      x = n - 1;
    }
    count++;
  }

  let j = m - 1;
  let y = n - 1;

  while (i !== 0 || x !== -1) {
    if (x === -1) {
      i--;
      x = n - 1;
    }
    if (y === -1) {
      j--;
      y = n - 1;
    }
    grid[j][y] = grid[i][x];
    x--;
    y--;
  }

  let idx = 0;
  while (k > 0) {
    if (y === -1) {
      j--;
      y = n - 1;
    }
    grid[j][y] = lastKElements[idx];
    y--;
    k--;
    idx++;
  }

  return grid;
}
