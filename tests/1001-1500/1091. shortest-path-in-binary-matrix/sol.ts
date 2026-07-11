function Solution() {
  return {
    shortestPathBinaryMatrix(grid: number[][]): number {
      const n = grid.length;
      if (grid[0][0] === 1 || grid[n - 1][n - 1] === 1) {
        return -1;
      }
      if (n === 1) {
        return 1;
      }
      const dist: number[][] = Array.from({ length: n }, () =>
        Array(n).fill(Number.MAX_SAFE_INTEGER),
      );
      const q: [number, number][] = [[0, 0]];
      dist[0][0] = 1;
      for (let head = 0; head < q.length; head++) {
        const [r, c] = q[head];
        const d = dist[r][c] + 1;
        for (let dr = -1; dr <= 1; dr++) {
          for (let dc = -1; dc <= 1; dc++) {
            if (dr === 0 && dc === 0) continue;
            const nr = r + dr;
            const nc = c + dc;
            if (nr < 0 || nr >= n || nc < 0 || nc >= n || grid[nr][nc] === 1)
              continue;
            if (d < dist[nr][nc]) {
              dist[nr][nc] = d;
              if (nr === n - 1 && nc === n - 1) {
                return d;
              }
              q.push([nr, nc]);
            }
          }
        }
      }
      return -1;
    },
  };
}
