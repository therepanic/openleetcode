function minTime(n: number, edges: number[][], hasApple: boolean[]): number {
  const adj: number[][] = Array.from({ length: n }, () => []);
  const degree: number[] = Array(n).fill(0);

  for (const [u, v] of edges) {
    adj[u].push(v);
    adj[v].push(u);
    degree[u]++;
    degree[v]++;
  }

  const q: number[] = [];
  for (let i = 1; i < n; i++) {
    if (degree[i] === 1 && !hasApple[i]) {
      q.push(i);
    }
  }

  const keep: boolean[] = Array(n).fill(true);

  while (q.length > 0) {
    const u = q.shift()!;
    keep[u] = false;

    for (const v of adj[u]) {
      degree[v]--;
      if (v !== 0 && keep[v] && !hasApple[v] && degree[v] === 1) {
        q.push(v);
      }
    }
  }

  const activeNodes = keep.filter((k) => k).length;
  return Math.max(0, (activeNodes - 1) * 2);
}
