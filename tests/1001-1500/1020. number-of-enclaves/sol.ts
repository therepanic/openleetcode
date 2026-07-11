function numEnclaves(grid: number[][]): number {
  let total = 0;
  for (const row of grid) {
    for (const val of row) {
      total += val;
    }
  }

  const m = grid.length;
  const n = grid[0].length;
  if (m === 1 || n === 1) return 0;

  const q: [number, number][] = [];
  const seen = new Set<string>();

  for (let i = 0; i < n; i++) {
    if (grid[0][i] === 1) {
      q.push([0, i]);
      seen.add(`0,${i}`);
    }
    if (grid[m - 1][i] === 1) {
      q.push([m - 1, i]);
      seen.add(`${m - 1},${i}`);
    }
  }
  for (let i = 1; i < m - 1; i++) {
    if (grid[i][0] === 1) {
      q.push([i, 0]);
      seen.add(`${i},0`);
    }
    if (grid[i][n - 1] === 1) {
      q.push([i, n - 1]);
      seen.add(`${i},${n - 1}`);
    }
  }

  const directions = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0],
  ];
  let nextTotal = 0;

  while (q.length > 0) {
    const [x, y] = q.shift()!;
    nextTotal++;

    for (const dir of directions) {
      const nx = x + dir[0];
      const ny = y + dir[1];
      const key = `${nx},${ny}`;
      if (
        nx >= 0 &&
        nx < m &&
        ny >= 0 &&
        ny < n &&
        grid[nx][ny] === 1 &&
        !seen.has(key)
      ) {
        q.push([nx, ny]);
        seen.add(key);
      }
    }
  }

  return total - nextTotal;
}
