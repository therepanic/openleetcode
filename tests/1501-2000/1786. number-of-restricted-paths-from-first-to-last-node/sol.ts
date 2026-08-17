function countRestrictedPaths(n: number, edges: number[][]): number {
  const mod = 1_000_000_007;
  const graph: [number, number][][] = Array.from({ length: n + 1 }, () => []);
  for (const e of edges) {
    graph[e[0]].push([e[1], e[2]]);
    graph[e[1]].push([e[0], e[2]]);
  }

  const dist: number[] = Array(n + 1).fill(Infinity);
  dist[n] = 0;
  const pq: [number, number][] = [[0, n]];
  while (pq.length) {
    pq.sort((a, b) => a[0] - b[0]);
    const [d, node] = pq.shift()!;
    if (d > dist[node]) continue;
    for (const [next, w] of graph[node]) {
      const nd = d + w;
      if (nd < dist[next]) {
        dist[next] = nd;
        pq.push([nd, next]);
      }
    }
  }

  const dp: number[] = Array(n + 1).fill(0);
  dp[n] = 1;
  const nodes = Array.from({ length: n }, (_, i) => i + 1).sort(
    (a, b) => dist[a] - dist[b],
  );
  for (const u of nodes) {
    for (const [v] of graph[u]) {
      if (dist[u] > dist[v]) {
        dp[u] = (dp[u] + dp[v]) % mod;
      }
    }
  }
  return dp[1];
}
