function minimumEffortPath(heights: number[][]): number {
  if (heights.length === 0) return 0;
  const rows = heights.length,
    cols = heights[0].length;
  const pq: number[][] = [[0, 0, 0]];
  const push = (x: number[]) => {
    pq.push(x);
    pq.sort((a, b) => a[0] - b[0]);
  };
  push([0, 0, 0]);
  let maxEffort = 0;
  const visited = new Set<string>();
  const dirs = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];
  while (pq.length > 0) {
    const curr = pq.shift()!;
    const effort = curr[0],
      r = curr[1],
      c = curr[2];
    maxEffort = Math.max(maxEffort, effort);
    if (r === rows - 1 && c === cols - 1) return maxEffort;
    const key = `${r},${c}`;
    if (visited.has(key)) continue;
    visited.add(key);
    for (const d of dirs) {
      const nr = r + d[0],
        nc = c + d[1];
      if (
        nr >= 0 &&
        nr < rows &&
        nc >= 0 &&
        nc < cols &&
        !visited.has(`${nr},${nc}`)
      ) {
        const newEffort = Math.abs(heights[nr][nc] - heights[r][c]);
        push([newEffort, nr, nc]);
      }
    }
  }
  return maxEffort;
}
