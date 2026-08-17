function nearestExit(maze: string[][], entrance: number[]): number {
  const n = maze.length,
    m = maze[0].length;
  const visited = Array.from({ length: n }, () => Array(m).fill(false));
  const q: [number, number, number][] = [[entrance[0], entrance[1], 0]];
  visited[entrance[0]][entrance[1]] = true;
  const dirs = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
  ];

  while (q.length > 0) {
    const [r, c, dist] = q.shift()!;
    for (const [dr, dc] of dirs) {
      const nr = r + dr,
        nc = c + dc;
      if (
        nr >= 0 &&
        nc >= 0 &&
        nr < n &&
        nc < m &&
        !visited[nr][nc] &&
        maze[nr][nc] === "."
      ) {
        visited[nr][nc] = true;
        if (nr === 0 || nc === 0 || nr === n - 1 || nc === m - 1)
          return dist + 1;
        q.push([nr, nc, dist + 1]);
      }
    }
  }
  return -1;
}
