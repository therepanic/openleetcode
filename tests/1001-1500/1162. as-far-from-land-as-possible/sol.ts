function maxDistance(grid: number[][]): number {
  if (!grid || grid.length === 0 || grid[0].length === 0) {
    return -1;
  }

  const n = grid.length;
  let frontier: [number, number][] = [];

  for (let r = 0; r < n; r++) {
    for (let c = 0; c < n; c++) {
      if (grid[r][c] === 1) {
        frontier.push([r, c]);
      }
    }
  }

  if (frontier.length === 0 || frontier.length === n * n) {
    return -1;
  }

  const directions: [number, number][] = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
  ];
  let distance = -1;

  while (frontier.length > 0) {
    const nextFrontier: [number, number][] = [];
    distance++;

    for (const [r, c] of frontier) {
      for (const [dr, dc] of directions) {
        const nr = r + dr;
        const nc = c + dc;

        if (nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] === 0) {
          grid[nr][nc] = 1;
          nextFrontier.push([nr, nc]);
        }
      }
    }

    frontier = nextFrontier;
  }

  return distance;
}
