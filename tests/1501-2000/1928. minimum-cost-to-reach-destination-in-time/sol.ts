function minCost(
  maxTime: number,
  edges: number[][],
  passingFees: number[],
): number {
  const n = passingFees.length;
  const graph: Array<Array<[number, number]>> = Array.from(
    { length: n },
    () => [],
  );
  for (const [u, v, t] of edges) {
    graph[u].push([v, t]);
    graph[v].push([u, t]);
  }
  const times = new Array(n).fill(maxTime + 1);
  const costs = new Array(n).fill(Infinity);
  times[0] = 0;
  costs[0] = passingFees[0];
  // Use simple array as priority queue (sort each time)
  const pq: Array<[number, number, number]> = [[passingFees[0], 0, 0]];
  while (pq.length) {
    // find min
    let minIdx = 0;
    for (let i = 1; i < pq.length; i++) {
      if (
        pq[i][0] < pq[minIdx][0] ||
        (pq[i][0] === pq[minIdx][0] && pq[i][1] < pq[minIdx][1])
      ) {
        minIdx = i;
      }
    }
    const [cost, time, city] = pq.splice(minIdx, 1)[0];
    if (city === n - 1) return cost;
    for (const [nxt, t] of graph[city]) {
      const nt = time + t;
      if (nt > maxTime) continue;
      const nc = cost + passingFees[nxt];
      if (nc < costs[nxt] || nt < times[nxt]) {
        costs[nxt] = nc;
        times[nxt] = nt;
        pq.push([nc, nt, nxt]);
      }
    }
  }
  return -1;
}
