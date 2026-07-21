function minimumMoves(grid: number[][]): number {
  const n = grid.length;
  const target: [number, number, number] = [n - 1, n - 2, 0];

  const queue: Array<[[number, number, number], number]> = [[[0, 0, 0], 0]];
  const visited: boolean[][][] = Array.from({ length: n }, () =>
    Array.from({ length: n }, () => [false, false]),
  );
  visited[0][0][0] = true;

  while (queue.length > 0) {
    const [state, dist] = queue.shift()!;
    const [r, c, o] = state;

    if (r === target[0] && c === target[1] && o === target[2]) {
      return dist;
    }

    if (o === 0) {
      if (c + 2 < n && grid[r][c + 2] === 0) {
        if (!visited[r][c + 1][0]) {
          visited[r][c + 1][0] = true;
          queue.push([[r, c + 1, 0], dist + 1]);
        }
      }
      if (r + 1 < n && grid[r + 1][c] === 0 && grid[r + 1][c + 1] === 0) {
        if (!visited[r + 1][c][0]) {
          visited[r + 1][c][0] = true;
          queue.push([[r + 1, c, 0], dist + 1]);
        }
      }
    } else {
      if (c + 1 < n && grid[r][c + 1] === 0 && grid[r + 1][c + 1] === 0) {
        if (!visited[r][c + 1][1]) {
          visited[r][c + 1][1] = true;
          queue.push([[r, c + 1, 1], dist + 1]);
        }
      }
      if (r + 2 < n && grid[r + 2][c] === 0) {
        if (!visited[r + 1][c][1]) {
          visited[r + 1][c][1] = true;
          queue.push([[r + 1, c, 1], dist + 1]);
        }
      }
    }

    if (
      r + 1 < n &&
      c + 1 < n &&
      grid[r + 1][c] === 0 &&
      grid[r][c + 1] === 0 &&
      grid[r + 1][c + 1] === 0
    ) {
      const newO = 1 - o;
      if (!visited[r][c][newO]) {
        visited[r][c][newO] = true;
        queue.push([[r, c, newO], dist + 1]);
      }
    }
  }

  return -1;
}
