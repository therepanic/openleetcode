function minCostConnectPoints(points: number[][]): number {
  const n = points.length;
  let minCost = 0;
  const visited = new Array(n).fill(false);
  const pq: [number, number][] = [[0, 0]];
  const cache = new Map<number, number>();
  cache.set(0, 0);

  while (pq.length > 0) {
    pq.sort((a, b) => a[0] - b[0]);
    const [cost, u] = pq.shift()!;
    if (visited[u]) continue;
    visited[u] = true;
    minCost += cost;
    for (let v = 0; v < n; v++) {
      if (!visited[v]) {
        const dist =
          Math.abs(points[u][0] - points[v][0]) +
          Math.abs(points[u][1] - points[v][1]);
        if (dist < (cache.get(v) ?? Number.MAX_SAFE_INTEGER)) {
          cache.set(v, dist);
          pq.push([dist, v]);
        }
      }
    }
  }
  return minCost;
}
