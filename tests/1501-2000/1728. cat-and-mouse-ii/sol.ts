function canMouseWin(
  grid: string[],
  catJump: number,
  mouseJump: number,
): boolean {
  const m = grid.length,
    n = grid[0].length;
  const walls = new Set<number>();
  let food: number, cat: number, mouse: number;

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      const idx = i * n + j;
      if (grid[i][j] === "F") food = idx;
      else if (grid[i][j] === "C") cat = idx;
      else if (grid[i][j] === "M") mouse = idx;
      else if (grid[i][j] === "#") walls.add(idx);
    }
  }

  const dirs = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1],
  ];
  const memo = new Map<number, boolean>();
  const maxTurns = m * n * 2;

  function dfs(c: number, mo: number, turn: number): boolean {
    const key = (c * m * n + mo) * maxTurns + turn;
    if (memo.has(key)) return memo.get(key)!;

    if (c === food || c === mo || turn >= maxTurns) {
      memo.set(key, false);
      return false;
    }
    if (mo === food) {
      memo.set(key, true);
      return true;
    }

    let result: boolean;
    if (turn % 2 === 0) {
      // mouse
      result = false;
      const mx = Math.floor(mo / n),
        my = mo % n;
      outer: for (const d of dirs) {
        for (let jump = 0; jump <= mouseJump; jump++) {
          const nx = mx + jump * d[0],
            ny = my + jump * d[1];
          if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.has(nx * n + ny))
            break;
          if (dfs(c, nx * n + ny, turn + 1)) {
            result = true;
            break outer;
          }
        }
      }
    } else {
      // cat
      result = true;
      const cx = Math.floor(c / n),
        cy = c % n;
      outer: for (const d of dirs) {
        for (let jump = 0; jump <= catJump; jump++) {
          const nx = cx + jump * d[0],
            ny = cy + jump * d[1];
          if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.has(nx * n + ny))
            break;
          if (!dfs(nx * n + ny, mo, turn + 1)) {
            result = false;
            break outer;
          }
        }
      }
    }

    memo.set(key, result);
    return result;
  }

  return dfs(cat!, mouse!, 0);
}
