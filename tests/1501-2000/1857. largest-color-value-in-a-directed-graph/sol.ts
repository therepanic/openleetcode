function largestPathValue(colors: string, edges: number[][]): number {
  const INF = Number.MAX_SAFE_INTEGER;
  const n = colors.length;
  const adj: number[][] = Array.from({ length: n }, () => []);
  for (const [u, v] of edges) {
    adj[u].push(v);
  }

  const count: number[][] = Array.from({ length: n }, () =>
    new Array(26).fill(0),
  );
  const vis: number[] = new Array(n).fill(0);

  function dfs(node: number): number {
    if (vis[node] === 1) return INF;
    if (vis[node] === 2) return count[node][colors.charCodeAt(node) - 97];

    vis[node] = 1;
    for (const nxt of adj[node]) {
      const res = dfs(nxt);
      if (res === INF) return INF;
      for (let c = 0; c < 26; c++) {
        count[node][c] = Math.max(count[node][c], count[nxt][c]);
      }
    }

    const col = colors.charCodeAt(node) - 97;
    count[node][col]++;
    vis[node] = 2;
    return count[node][col];
  }

  let ans = 0;
  for (let i = 0; i < n; i++) {
    const val = dfs(i);
    if (val === INF) return -1;
    ans = Math.max(ans, val);
  }

  return ans;
}
