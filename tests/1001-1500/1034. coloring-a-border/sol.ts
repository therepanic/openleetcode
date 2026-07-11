function colorBorder(
  grid: number[][],
  row: number,
  col: number,
  color: number,
): number[][] {
  const rows = grid.length;
  const cols = grid[0].length;
  const startColor = grid[row][col];

  if (startColor === color) {
    return grid;
  }

  const queue: [number, number][] = [[row, col]];
  const visited: boolean[][] = Array.from({ length: rows }, () =>
    Array(cols).fill(false),
  );
  visited[row][col] = true;
  const borders: [number, number][] = [];

  const dirs = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
  ];

  while (queue.length > 0) {
    const [r, c] = queue.shift()!;
    let isBorder = false;

    for (const [dr, dc] of dirs) {
      const nr = r + dr;
      const nc = c + dc;

      if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) {
        isBorder = true;
      } else if (grid[nr][nc] !== startColor) {
        isBorder = true;
      } else if (!visited[nr][nc]) {
        visited[nr][nc] = true;
        queue.push([nr, nc]);
      }
    }

    if (isBorder) {
      borders.push([r, c]);
    }
  }

  for (const [r, c] of borders) {
    grid[r][c] = color;
  }

  return grid;
}
