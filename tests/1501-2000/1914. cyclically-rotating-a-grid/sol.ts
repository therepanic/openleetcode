function rotateGrid(grid: number[][], k: number): number[][] {
  let t = 0,
    l = 0;

  let b = grid.length - 1,
    r = grid[0].length - 1;

  while (t < b && l < r) {
    const ln = b - t,
      wid = r - l;

    const perimeter = 2 * ln + 2 * wid;

    let steps = k % perimeter;

    while (steps-- > 0) {
      const tmp = grid[t][l];

      for (let i = l; i < r; i++) grid[t][i] = grid[t][i + 1];

      for (let i = t; i < b; i++) grid[i][r] = grid[i + 1][r];

      for (let i = r; i > l; i--) grid[b][i] = grid[b][i - 1];

      for (let i = b; i > t; i--) grid[i][l] = grid[i - 1][l];

      grid[t + 1][l] = tmp;
    }

    t++;
    l++;
    b--;
    r--;
  }

  return grid;
}
