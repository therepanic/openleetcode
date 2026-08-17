function largestMagicSquare(grid: number[][]): number {
  const m = grid.length,
    n = grid[0].length;
  let res = 1;

  function isValid(i: number, j: number, k: number): boolean {
    let s = -1;
    for (let x = i; x < i + k; x++) {
      let row = 0;
      for (let y = j; y < j + k; y++) row += grid[x][y];
      if (s === -1) s = row;
      else if (s !== row) return false;
    }

    for (let y = j; y < j + k; y++) {
      let col = 0;
      for (let x = i; x < i + k; x++) col += grid[x][y];
      if (col !== s) return false;
    }

    let d1 = 0,
      d2 = 0;
    for (let d = 0; d < k; d++) {
      d1 += grid[i + d][j + d];
      d2 += grid[i + d][j + k - 1 - d];
    }
    return d1 === s && d2 === s;
  }

  for (let k = 2; k <= Math.min(m, n); k++) {
    for (let i = 0; i <= m - k; i++) {
      for (let j = 0; j <= n - k; j++) {
        if (isValid(i, j, k)) res = k;
      }
    }
  }
  return res;
}
