function maxAreaOfIsland(grid: number[][]): number {
  const rows = grid.length;
  const cols = grid[0].length;
  const visited: boolean[][] = Array.from({ length: rows }, () =>
    Array(cols).fill(false),
  );
  let maxIsland = 0;

  const dfs = (r: number, c: number): number => {
    if (
      r < 0 ||
      r >= rows ||
      c < 0 ||
      c >= cols ||
      visited[r][c] ||
      grid[r][c] === 0
    ) {
      return 0;
    }

    visited[r][c] = true;

    return 1 + dfs(r + 1, c) + dfs(r - 1, c) + dfs(r, c + 1) + dfs(r, c - 1);
  };

  for (let r = 0; r < rows; r++) {
    for (let c = 0; c < cols; c++) {
      if (grid[r][c] === 1 && !visited[r][c]) {
        maxIsland = Math.max(maxIsland, dfs(r, c));
      }
    }
  }

  return maxIsland;
}
