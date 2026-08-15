function unhappyFriends(
  n: number,
  preferences: number[][],
  pairs: number[][],
): number {
  const graph: number[] = new Array(n);
  for (const [u, v] of pairs) {
    graph[u] = v;
    graph[v] = u;
  }

  const rank: number[][] = Array.from({ length: n }, () =>
    new Array(n).fill(0),
  );
  for (let i = 0; i < n; i++) {
    preferences[i].forEach((e, j) => {
      rank[i][e] = j;
    });
  }

  let ans = 0;
  for (let u = 0; u < n; u++) {
    const v = graph[u];
    let unhappy = false;
    for (const a of preferences[u]) {
      if (a === v) break;
      const av = graph[a];
      if (rank[a][u] < rank[a][av]) {
        unhappy = true;
        break;
      }
    }
    if (unhappy) ans++;
  }
  return ans;
}
