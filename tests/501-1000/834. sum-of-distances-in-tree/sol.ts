function sumOfDistancesInTree(n: number, edges: number[][]): number[] {
  const adj: number[][] = Array.from({ length: n }, () => []);
  for (const [u, v] of edges) {
    adj[u].push(v);
    adj[v].push(u);
  }

  const count: number[] = Array(n).fill(1);
  const ans: number[] = Array(n).fill(0);

  const dfsIn = (node: number, parent: number): void => {
    for (const child of adj[node]) {
      if (child !== parent) {
        dfsIn(child, node);
        count[node] += count[child];
        ans[node] += ans[child] + count[child];
      }
    }
  };

  const dfsOut = (node: number, parent: number): void => {
    for (const child of adj[node]) {
      if (child !== parent) {
        ans[child] = ans[node] - count[child] + (n - count[child]);
        dfsOut(child, node);
      }
    }
  };

  dfsIn(0, -1);
  dfsOut(0, -1);
  return ans;
}
