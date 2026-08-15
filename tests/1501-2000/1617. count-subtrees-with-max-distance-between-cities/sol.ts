function countSubgraphsForEachDiameter(n: number, edges: number[][]): number[] {
  const graph: number[][] = Array.from({ length: n }, () => []);
  for (const [u0, v0] of edges) {
    const u = u0 - 1,
      v = v0 - 1;
    graph[u].push(v);
    graph[v].push(u);
  }
  const answer: number[] = new Array(n - 1).fill(0);
  for (let mask = 1; mask < 1 << n; mask++) {
    if (popcount(mask) <= 1) continue;
    const b = mask & -mask;
    const s =
      Math.clz32(b) === 31 ? 31 - Math.floor(Math.log2(b)) : 31 - Math.clz32(b);
    // better: use Math.log2
    const start = Math.log2(b);
    const seen = new Array(n).fill(false);
    seen[start] = true;
    let cnt = 1;
    const q: number[] = [start];
    while (q.length) {
      const u = q.shift()!;
      for (const v of graph[u]) {
        if (((mask >> v) & 1) === 1 && !seen[v]) {
          seen[v] = true;
          cnt++;
          q.push(v);
        }
      }
    }
    if (cnt !== popcount(mask)) continue;
    const bfs = (s: number): [number, number] => {
      const dist = new Array(n).fill(-1);
      dist[s] = 0;
      const q: number[] = [s];
      let last = s;
      while (q.length) {
        const u = q.shift()!;
        last = u;
        for (const v of graph[u]) {
          if (((mask >> v) & 1) === 1 && dist[v] === -1) {
            dist[v] = dist[u] + 1;
            q.push(v);
          }
        }
      }
      return [last, dist[last]];
    };
    const [a, _] = bfs(start);
    const [, d] = bfs(a);
    if (d >= 1) answer[d - 1]++;
  }
  return answer;
}

function popcount(x: number): number {
  let count = 0;
  while (x) {
    count += x & 1;
    x >>= 1;
  }
  return count;
}
