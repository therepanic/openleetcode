function findBall(grid: number[][]): number[] {
  const m = grid.length,
    n = grid[0].length;
  const result: number[] = new Array(n).fill(0);
  for (let col = 0; col < n; col++) {
    let cur = col;
    for (let row = 0; row < m; row++) {
      const d = grid[row][cur];
      const nxt = cur + d;
      if (nxt < 0 || nxt >= n || grid[row][nxt] !== d) {
        cur = -1;
        break;
      }
      cur = nxt;
    }
    result[col] = cur;
  }
  return result;
}
