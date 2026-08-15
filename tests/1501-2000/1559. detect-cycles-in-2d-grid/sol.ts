function containsCycle(grid: string[][]): boolean {
  const n = grid.length;
  const m = grid[0].length;
  const visited: boolean[][] = Array.from({ length: n }, () =>
    Array(m).fill(false),
  );
  const directions = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
  ];

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      if (!visited[i][j]) {
        if (bfs(i, j, grid, visited, directions)) return true;
      }
    }
  }
  return false;

  function bfs(
    startI: number,
    startJ: number,
    grid: string[][],
    visited: boolean[][],
    directions: number[][],
  ): boolean {
    const n = grid.length;
    const m = grid[0].length;
    const queue: number[][] = [[startI, startJ, -1, -1]];
    visited[startI][startJ] = true;
    let head = 0;

    while (head < queue.length) {
      const [x, y, px, py] = queue[head++];
      for (const [dx, dy] of directions) {
        const nx = x + dx,
          ny = y + dy;
        if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
        if (grid[nx][ny] !== grid[x][y]) continue;
        if (nx === px && ny === py) continue;
        if (visited[nx][ny]) return true;
        visited[nx][ny] = true;
        queue.push([nx, ny, x, y]);
      }
    }
    return false;
  }
}
