function containVirus(isInfected: number[][]): number {
  const rows = isInfected.length;
  const cols = isInfected[0].length;
  const directions = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];
  let totalWalls = 0;

  while (true) {
    const seen: boolean[][] = Array.from({ length: rows }, () =>
      Array(cols).fill(false),
    );
    const regions: [number, number][][] = [];
    const frontiers: Set<string>[] = [];
    const wallsNeeded: number[] = [];

    for (let r = 0; r < rows; r++) {
      for (let c = 0; c < cols; c++) {
        if (isInfected[r][c] !== 1 || seen[r][c]) continue;
        const stack: [number, number][] = [[r, c]];
        seen[r][c] = true;
        const region: [number, number][] = [];
        const frontier = new Set<string>();
        let walls = 0;
        while (stack.length > 0) {
          const [cr, cc] = stack.pop()!;
          region.push([cr, cc]);
          for (const [dr, dc] of directions) {
            const nr = cr + dr;
            const nc = cc + dc;
            if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;
            if (isInfected[nr][nc] === 1 && !seen[nr][nc]) {
              seen[nr][nc] = true;
              stack.push([nr, nc]);
            } else if (isInfected[nr][nc] === 0) {
              walls++;
              frontier.add(`${nr},${nc}`);
            }
          }
        }
        regions.push(region);
        frontiers.push(frontier);
        wallsNeeded.push(walls);
      }
    }

    if (regions.length === 0) break;

    let target = 0;
    for (let i = 1; i < frontiers.length; i++) {
      if (frontiers[i].size > frontiers[target].size) {
        target = i;
      }
    }

    if (frontiers[target].size === 0) break;

    totalWalls += wallsNeeded[target];

    for (const [r, c] of regions[target]) {
      isInfected[r][c] = -1;
    }

    for (let i = 0; i < regions.length; i++) {
      if (i === target) continue;
      for (const coord of frontiers[i]) {
        const [r, c] = coord.split(",").map(Number);
        isInfected[r][c] = 1;
      }
    }
  }

  return totalWalls;
}
