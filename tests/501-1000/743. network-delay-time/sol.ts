function networkDelayTime(times: number[][], n: number, k: number): number {
  const graph: [number, number][][] = Array.from({ length: n + 1 }, () => []);
  for (const [u, v, w] of times) {
    graph[u].push([v, w]);
  }

  const inf = 1 << 30;
  const dist = new Array<number>(n + 1).fill(inf);
  const used = new Array<boolean>(n + 1).fill(false);
  dist[k] = 0;

  for (let step = 0; step < n; step++) {
    let node = -1;
    for (let i = 1; i <= n; i++) {
      if (!used[i] && (node === -1 || dist[i] < dist[node])) {
        node = i;
      }
    }
    if (node === -1 || dist[node] === inf) {
      break;
    }
    used[node] = true;
    for (const [v, w] of graph[node]) {
      if (dist[node] + w < dist[v]) {
        dist[v] = dist[node] + w;
      }
    }
  }

  let ans = 0;
  for (let i = 1; i <= n; i++) {
    if (dist[i] === inf) return -1;
    if (dist[i] > ans) ans = dist[i];
  }
  return ans;
}
