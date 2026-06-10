function numIslands(grid: string[][]): number {
  const rows = grid.length;
  const cols = grid[0].length;
  let islands = 0;
  const directions = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];

  for (let r = 0; r < rows; r++) {
    for (let c = 0; c < cols; c++) {
      if (grid[r][c] !== "1") {
        continue;
      }
      islands++;
      const queue: Array<[number, number]> = [[r, c]];
      let index = 0;
      grid[r][c] = "0";
      while (index < queue.length) {
        const [row, col] = queue[index++];
        for (const [dr, dc] of directions) {
          const nr = row + dr;
          const nc = col + dc;
          if (
            nr >= 0 &&
            nr < rows &&
            nc >= 0 &&
            nc < cols &&
            grid[nr][nc] === "1"
          ) {
            grid[nr][nc] = "0";
            queue.push([nr, nc]);
          }
        }
      }
    }
  }

  return islands;
}
