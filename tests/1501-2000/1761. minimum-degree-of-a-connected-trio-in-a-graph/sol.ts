function minTrioDegree(n: number, edges: number[][]): number {
  const adj: number[][] = Array.from({ length: n + 1 }, () =>
    Array(n + 1).fill(0),
  );
  const deg: number[] = Array(n + 1).fill(0);
  for (const [u, v] of edges) {
    adj[u][v] = 1;
    adj[v][u] = 1;
    deg[u]++;
    deg[v]++;
  }
  let ans = Number.MAX_SAFE_INTEGER;
  for (const [u, v] of edges) {
    for (let w = 1; w <= n; w++) {
      if (adj[u][w] === 1 && adj[v][w] === 1) {
        ans = Math.min(ans, deg[u] + deg[v] + deg[w] - 6);
      }
    }
  }
  return ans === Number.MAX_SAFE_INTEGER ? -1 : ans;
}
