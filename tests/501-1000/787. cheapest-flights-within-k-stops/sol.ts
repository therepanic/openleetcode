function findCheapestPrice(
  n: number,
  flights: number[][],
  src: number,
  dst: number,
  k: number,
): number {
  const matrix: [number, number][][] = Array.from({ length: n }, () => []);
  for (const [u, v, w] of flights) {
    matrix[u].push([v, w]);
  }

  const distance: number[] = new Array(n).fill(Number.MAX_SAFE_INTEGER);
  distance[src] = 0;

  const queue: [number, number][] = [[src, 0]];
  let steps = 0;

  while (queue.length > 0) {
    const level = queue.length;
    if (steps === k + 1) {
      break;
    }
    steps++;

    for (let i = 0; i < level; i++) {
      const [node, dist] = queue.shift()!;
      for (const [v, w] of matrix[node]) {
        if (w + dist < distance[v]) {
          distance[v] = w + dist;
          queue.push([v, dist + w]);
        }
      }
    }
  }

  return distance[dst] === Number.MAX_SAFE_INTEGER ? -1 : distance[dst];
}
