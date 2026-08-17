function minDays(grid: number[][]): number {
  const countIslands = (): number => {
    const seen = new Set<string>();
    let islands = 0;
    const dirs = [
      [-1, 0],
      [1, 0],
      [0, -1],
      [0, 1],
    ];

    for (let i = 0; i < grid.length; i++) {
      for (let j = 0; j < grid[0].length; j++) {
        if (grid[i][j] === 1 && !seen.has(`${i},${j}`)) {
          islands++;
          const stack = [[i, j]];
          seen.add(`${i},${j}`);
          while (stack.length > 0) {
            const cell = stack.pop()!;
            for (const d of dirs) {
              const nx = cell[0] + d[0];
              const ny = cell[1] + d[1];
              if (
                nx >= 0 &&
                nx < grid.length &&
                ny >= 0 &&
                ny < grid[0].length &&
                grid[nx][ny] === 1 &&
                !seen.has(`${nx},${ny}`)
              ) {
                seen.add(`${nx},${ny}`);
                stack.push([nx, ny]);
              }
            }
          }
        }
      }
    }
    return islands;
  };

  if (countIslands() !== 1) return 0;

  for (let i = 0; i < grid.length; i++) {
    for (let j = 0; j < grid[0].length; j++) {
      if (grid[i][j] === 1) {
        grid[i][j] = 0;
        if (countIslands() !== 1) return 1;
        grid[i][j] = 1;
      }
    }
  }
  return 2;
}
