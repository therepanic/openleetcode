function minCost(grid: number[][]): number {
  const m = grid.length;
  const n = grid[0].length;
  const minCost: number[][] = Array.from({ length: m }, () =>
    Array(n).fill(Infinity),
  );
  minCost[0][0] = 0;

  const deque: [number, number][] = [[0, 0]];

  const directions: [number, number][] = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0],
  ];

  while (deque.length > 0) {
    const [r, c] = deque.shift()!;

    for (let i = 0; i < 4; i++) {
      const nr = r + directions[i][0];
      const nc = c + directions[i][1];
      const cost = grid[r][c] !== i + 1 ? 1 : 0;

      if (
        nr >= 0 &&
        nr < m &&
        nc >= 0 &&
        nc < n &&
        minCost[r][c] + cost < minCost[nr][nc]
      ) {
        minCost[nr][nc] = minCost[r][c] + cost;

        if (cost === 1) {
          deque.push([nr, nc]);
        } else {
          deque.unshift([nr, nc]);
        }
      }
    }
  }

  return minCost[m - 1][n - 1];
}
