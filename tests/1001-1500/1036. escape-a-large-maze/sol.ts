function isEscapePossible(
  blocked: number[][],
  source: number[],
  target: number[],
): boolean {
  const blockedSet = new Set(blocked.map((b) => `${b[0]},${b[1]}`));
  const MAX = Math.floor((blocked.length * blocked.length) / 2);
  const dirs = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
  ];

  function bfs(start: number[], end: number[]): boolean {
    const visited = new Set<string>();
    const queue: number[][] = [start];
    visited.add(`${start[0]},${start[1]}`);
    let count = 0;

    while (queue.length > 0) {
      const cur = queue.shift()!;
      const x = cur[0],
        y = cur[1];
      if (x === end[0] && y === end[1]) return true;
      if (count > MAX) return true;

      for (const [dx, dy] of dirs) {
        const nx = x + dx;
        const ny = y + dy;
        const key = `${nx},${ny}`;
        if (
          nx >= 0 &&
          nx < 1e6 &&
          ny >= 0 &&
          ny < 1e6 &&
          !visited.has(key) &&
          !blockedSet.has(key)
        ) {
          visited.add(key);
          queue.push([nx, ny]);
        }
      }
      count++;
    }
    return false;
  }

  return bfs(source, target) && bfs(target, source);
}
