function maxProbability(
  n: number,
  edges: number[][],
  succProb: number[],
  start_node: number,
  end_node: number,
): number {
  const dist: number[] = new Array(n).fill(0);
  dist[start_node] = 1;

  for (let k = 0; k < n - 1; k++) {
    let updated = false;
    for (let i = 0; i < edges.length; i++) {
      const u = edges[i][0];
      const v = edges[i][1];
      if (dist[u] * succProb[i] > dist[v]) {
        dist[v] = dist[u] * succProb[i];
        updated = true;
      }
      if (dist[v] * succProb[i] > dist[u]) {
        dist[u] = dist[v] * succProb[i];
        updated = true;
      }
    }
    if (!updated) break;
  }

  return dist[end_node];
}
