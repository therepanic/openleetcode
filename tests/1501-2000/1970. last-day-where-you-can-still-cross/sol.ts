function latestDayToCross(row: number, col: number, cells: number[][]): number {
  let left = 1,
    right = cells.length,
    answer = 0;
  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (canCross(mid, row, col, cells)) {
      answer = mid;
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return answer;
}

function canCross(
  day: number,
  row: number,
  col: number,
  cells: number[][],
): boolean {
  const grid: number[][] = Array.from({ length: row }, () =>
    Array(col).fill(0),
  );
  for (let i = 0; i < day; i++) {
    const r = cells[i][0] - 1;
    const c = cells[i][1] - 1;
    grid[r][c] = 1;
  }

  const queueR: number[] = [];
  const queueC: number[] = [];
  const visited: boolean[][] = Array.from({ length: row }, () =>
    Array(col).fill(false),
  );

  for (let c = 0; c < col; c++) {
    if (grid[0][c] === 0) {
      queueR.push(0);
      queueC.push(c);
      visited[0][c] = true;
    }
  }

  const dr = [1, -1, 0, 0];
  const dc = [0, 0, 1, -1];
  let head = 0;
  while (head < queueR.length) {
    const r = queueR[head];
    const c = queueC[head];
    head++;
    if (r === row - 1) return true;
    for (let k = 0; k < 4; k++) {
      const nr = r + dr[k];
      const nc = c + dc[k];
      if (
        nr >= 0 &&
        nr < row &&
        nc >= 0 &&
        nc < col &&
        !visited[nr][nc] &&
        grid[nr][nc] === 0
      ) {
        visited[nr][nc] = true;
        queueR.push(nr);
        queueC.push(nc);
      }
    }
  }
  return false;
}
