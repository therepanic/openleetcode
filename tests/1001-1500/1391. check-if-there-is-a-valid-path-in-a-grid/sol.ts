function hasValidPath(grid: number[][]): boolean {
  const m = grid.length;
  const n = grid[0].length;

  const dir: { [key: number]: [number, number][] } = {
    1: [
      [0, -1],
      [0, 1],
    ],
    2: [
      [-1, 0],
      [1, 0],
    ],
    3: [
      [0, -1],
      [1, 0],
    ],
    4: [
      [0, 1],
      [1, 0],
    ],
    5: [
      [0, -1],
      [-1, 0],
    ],
    6: [
      [0, 1],
      [-1, 0],
    ],
  };

  const vis: boolean[][] = Array.from({ length: m }, () =>
    Array(n).fill(false),
  );
  const q: [number, number][] = [[0, 0]];
  vis[0][0] = true;

  while (q.length > 0) {
    const [r, c] = q.shift()!;

    if (r === m - 1 && c === n - 1) {
      return true;
    }

    for (const [dr, dc] of dir[grid[r][c]]) {
      const nr = r + dr;
      const nc = c + dc;

      if (nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc]) {
        continue;
      }

      for (const [bdr, bdc] of dir[grid[nr][nc]]) {
        if (nr + bdr === r && nc + bdc === c) {
          vis[nr][nc] = true;
          q.push([nr, nc]);
        }
      }
    }
  }

  return false;
}
