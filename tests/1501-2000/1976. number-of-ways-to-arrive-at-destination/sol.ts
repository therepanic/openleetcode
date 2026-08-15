function countPaths(n: number, roads: number[][]): number {
  const graph: [number, number][][] = Array.from({ length: n }, () => []);
  for (const [u, v, time] of roads) {
    graph[u].push([v, time]);
    graph[v].push([u, time]);
  }

  const dist: number[] = new Array(n).fill(Number.MAX_SAFE_INTEGER);
  const ways: number[] = new Array(n).fill(0);
  dist[0] = 0;
  ways[0] = 1;

  const pq: [number, number][] = [[0, 0]];

  const MOD = 1_000_000_007;

  while (pq.length > 0) {
    pq.sort((a, b) => a[0] - b[0]);
    const [d, node] = pq.shift()!;

    if (d > dist[node]) continue;

    for (const [neighbor, time] of graph[node]) {
      if (dist[node] + time < dist[neighbor]) {
        dist[neighbor] = dist[node] + time;
        ways[neighbor] = ways[node];
        pq.push([dist[neighbor], neighbor]);
      } else if (dist[node] + time === dist[neighbor]) {
        ways[neighbor] = (ways[neighbor] + ways[node]) % MOD;
      }
    }
  }

  return ways[n - 1];
}
