function minFlips(mat: number[][]): number {
  const m = mat.length;
  const n = mat[0].length;
  const masks: number[] = [];
  const dirs = [
    [0, 0],
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];

  for (let r = 0; r < m; r++) {
    for (let c = 0; c < n; c++) {
      let mask = 0;
      for (const [dr, dc] of dirs) {
        const nr = r + dr;
        const nc = c + dc;
        if (0 <= nr && nr < m && 0 <= nc && nc < n) {
          mask |= 1 << (nr * n + nc);
        }
      }
      masks.push(mask);
    }
  }

  let start = 0;
  for (let r = 0; r < m; r++) {
    for (let c = 0; c < n; c++) {
      if (mat[r][c] === 1) {
        start |= 1 << (r * n + c);
      }
    }
  }

  const size = 1 << (m * n);
  const dist = new Array<number>(size).fill(-1);
  const q: number[] = [start];
  dist[start] = 0;

  for (let head = 0; head < q.length; head++) {
    const state = q[head];
    const steps = dist[state];
    if (state === 0) {
      return steps;
    }
    for (const mask of masks) {
      const next = state ^ mask;
      if (dist[next] === -1) {
        dist[next] = steps + 1;
        q.push(next);
      }
    }
  }

  return -1;
}
