function swimInWater(grid: number[][]): number {
  const n = grid.length;
  const dirs = [
    [0, -1],
    [0, 1],
    [-1, 0],
    [1, 0],
  ];

  const dfs = (x: number, y: number, t: number, vis: boolean[][]): boolean => {
    if (x === n - 1 && y === n - 1) return true;
    vis[x][y] = true;
    for (const [dx, dy] of dirs) {
      const nx = x + dx,
        ny = y + dy;
      if (
        nx >= 0 &&
        nx < n &&
        ny >= 0 &&
        ny < n &&
        !vis[nx][ny] &&
        grid[nx][ny] <= t
      ) {
        if (dfs(nx, ny, t, vis)) return true;
      }
    }
    return false;
  };

  let low = 0,
    high = n * n - 1,
    ans = Infinity;
  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    const vis: boolean[][] = Array.from({ length: n }, () =>
      Array(n).fill(false),
    );
    if (grid[0][0] <= mid && dfs(0, 0, mid, vis)) {
      ans = mid;
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  return ans;
}
