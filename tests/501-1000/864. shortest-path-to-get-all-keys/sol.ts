function shortestPathAllKeys(grid: string[]): number {
  const m = grid.length;
  const n = grid[0].length;
  let start_i = 0,
    start_j = 0;
  let total_keys = 0;

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] === "@") {
        start_i = i;
        start_j = j;
      }
      if (grid[i][j] >= "a" && grid[i][j] <= "f") {
        total_keys++;
      }
    }
  }

  const target_mask = (1 << total_keys) - 1;
  const queue: [number, number, number][] = [[start_i, start_j, 0]];
  const seen: boolean[][][] = Array.from({ length: m }, () =>
    Array.from({ length: n }, () => Array(1 << total_keys).fill(false)),
  );
  seen[start_i][start_j][0] = true;
  let moves = 0;
  const dirs = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0],
  ];

  while (queue.length > 0) {
    const size = queue.length;
    for (let k = 0; k < size; k++) {
      const [r, c, mask] = queue.shift()!;

      if (mask === target_mask) {
        return moves;
      }

      for (const [dx, dy] of dirs) {
        const nr = r + dx;
        const nc = c + dy;

        if (nr < 0 || nr >= m || nc < 0 || nc >= n) {
          continue;
        }

        const next_val = grid[nr][nc];
        let next_mask = mask;

        if (next_val >= "a" && next_val <= "f") {
          const key_bit = next_val.charCodeAt(0) - "a".charCodeAt(0);
          next_mask |= 1 << key_bit;
        }

        if (next_val >= "A" && next_val <= "F") {
          const lock_bit =
            next_val.toLowerCase().charCodeAt(0) - "a".charCodeAt(0);
          if ((next_mask & (1 << lock_bit)) === 0) {
            continue;
          }
        }

        if (!seen[nr][nc][next_mask] && next_val !== "#") {
          queue.push([nr, nc, next_mask]);
          seen[nr][nc][next_mask] = true;
        }
      }
    }
    moves++;
  }

  return -1;
}
