function shortestPathLength(graph: number[][]): number {
  const n = graph.length;
  if (n === 1) return 0;

  const FULL = (1 << n) - 1;
  const visited: boolean[][] = Array.from({ length: n }, () =>
    Array(1 << n).fill(false),
  );
  const queue: [number, number, number][] = [];

  for (let i = 0; i < n; i++) {
    const mask = 1 << i;
    queue.push([i, mask, 0]);
    visited[i][mask] = true;
  }

  let front = 0;
  while (front < queue.length) {
    const [node, mask, dist] = queue[front++];

    if (mask === FULL) return dist;

    for (const nei of graph[node]) {
      const newMask = mask | (1 << nei);

      if (!visited[nei][newMask]) {
        visited[nei][newMask] = true;
        queue.push([nei, newMask, dist + 1]);
      }
    }
  }

  return -1;
}
