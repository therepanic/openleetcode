function hitBricks(grid: number[][], hits: number[][]): number[] {
  const m = grid.length,
    n = grid[0].length;
  const parent: number[] = Array.from({ length: m * n + 1 }, (_, i) => i);
  const rank: number[] = Array(m * n + 1).fill(1);

  const find = (p: number): number => {
    if (p !== parent[p]) {
      parent[p] = find(parent[p]);
    }
    return parent[p];
  };

  const union = (p: number, q: number): boolean => {
    let rootP = find(p);
    let rootQ = find(q);
    if (rootP === rootQ) return false;
    if (rank[rootP] > rank[rootQ]) {
      [rootP, rootQ] = [rootQ, rootP];
    }
    parent[rootP] = rootQ;
    rank[rootQ] += rank[rootP];
    return true;
  };

  const seen = new Set<number>();
  for (const [i, j] of hits) {
    if (grid[i][j] === 1) {
      seen.add(i * n + j);
      grid[i][j] = 0;
    }
  }

  for (let j = 0; j < n; j++) {
    if (grid[0][j] === 1) {
      union(j, m * n);
    }
  }

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] === 1) {
        if (i > 0 && grid[i - 1][j] === 1) {
          union(i * n + j, (i - 1) * n + j);
        }
        if (j > 0 && grid[i][j - 1] === 1) {
          union(i * n + j, i * n + j - 1);
        }
      }
    }
  }

  const ans: number[] = [];
  let prevStable = rank[find(m * n)];
  const dirs = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];

  for (let idx = hits.length - 1; idx >= 0; idx--) {
    const [i, j] = hits[idx];
    if (seen.has(i * n + j)) {
      grid[i][j] = 1;
      if (i === 0) {
        union(j, m * n);
      }
      for (const [di, dj] of dirs) {
        const ii = i + di,
          jj = j + dj;
        if (ii >= 0 && ii < m && jj >= 0 && jj < n && grid[ii][jj] === 1) {
          union(i * n + j, ii * n + jj);
        }
      }
      const currStable = rank[find(m * n)];
      ans.push(Math.max(0, currStable - prevStable - 1));
      prevStable = currStable;
    } else {
      ans.push(0);
    }
  }

  return ans.reverse();
}
