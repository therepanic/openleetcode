function minPushBox(grid: string[][]): number {
  const rows = grid.length,
    cols = grid[0].length;
  let player: [number, number] = [0, 0],
    box: [number, number] = [0, 0],
    target: [number, number] = [0, 0];
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (grid[i][j] === "S") player = [i, j];
      else if (grid[i][j] === "B") box = [i, j];
      else if (grid[i][j] === "T") target = [i, j];
    }
  }

  const dirs: [number, number][] = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];
  const q: [number, number, number, number, number][] = [
    [box[0], box[1], player[0], player[1], 0],
  ];
  const seen = new Set<string>();
  seen.add(`${box[0]},${box[1]},${player[0]},${player[1]}`);

  while (q.length > 0) {
    const [bx, by, px, py, pushes] = q.shift()!;
    if (bx === target[0] && by === target[1]) return pushes;

    const reachable = new Set<string>();
    const walk: [number, number][] = [[px, py]];
    reachable.add(`${px},${py}`);

    while (walk.length > 0) {
      const [x, y] = walk.shift()!;
      for (const [dx, dy] of dirs) {
        const nx = x + dx,
          ny = y + dy;
        if (
          nx >= 0 &&
          nx < rows &&
          ny >= 0 &&
          ny < cols &&
          !(nx === bx && ny === by) &&
          grid[nx][ny] !== "#" &&
          !reachable.has(`${nx},${ny}`)
        ) {
          reachable.add(`${nx},${ny}`);
          walk.push([nx, ny]);
        }
      }
    }

    for (const [dx, dy] of dirs) {
      const nbx = bx + dx,
        nby = by + dy;
      const behindX = bx - dx,
        behindY = by - dy;
      if (
        nbx >= 0 &&
        nbx < rows &&
        nby >= 0 &&
        nby < cols &&
        grid[nbx][nby] !== "#" &&
        reachable.has(`${behindX},${behindY}`) &&
        !seen.has(`${nbx},${nby},${bx},${by}`)
      ) {
        seen.add(`${nbx},${nby},${bx},${by}`);
        q.push([nbx, nby, bx, by, pushes + 1]);
      }
    }
  }
  return -1;
}
