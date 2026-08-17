function maximalNetworkRank(n: number, roads: number[][]): number {
  const a: number[][] = Array.from({ length: n }, () => Array(n).fill(0));
  for (const [u, v] of roads) {
    a[u][v] = 1;
    a[v][u] = 1;
  }

  const d: number[] = a.map((row) => row.reduce((x, y) => x + y, 0));

  const rank: number[][] = Array.from({ length: n }, () => Array(n).fill(-1));
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      if (i !== j) {
        rank[i][j] = d[i] + d[j] - a[i][j];
      }
    }
  }

  return Math.max(...rank.flat());
}
