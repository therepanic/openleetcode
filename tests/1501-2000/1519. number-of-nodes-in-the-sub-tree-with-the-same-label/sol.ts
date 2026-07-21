function countSubTrees(n: number, edges: number[][], labels: string): number[] {
  const matrix: number[][] = Array.from({ length: n }, () => []);
  for (const [u, v] of edges) {
    matrix[u].push(v);
    matrix[v].push(u);
  }

  const parent: number[] = new Array(n).fill(-1);
  const order: number[] = [0];
  for (let i = 0; i < order.length; i++) {
    const node = order[i];
    for (const child of matrix[node]) {
      if (child !== parent[node]) {
        parent[child] = node;
        order.push(child);
      }
    }
  }

  const counts: number[][] = Array.from({ length: n }, () =>
    new Array(26).fill(0),
  );
  const ans: number[] = new Array(n).fill(0);
  for (let i = order.length - 1; i >= 0; i--) {
    const node = order[i];
    const label = labels.charCodeAt(node) - 97;
    counts[node][label]++;
    ans[node] = counts[node][label];
    if (parent[node] !== -1) {
      for (let j = 0; j < 26; j++) {
        counts[parent[node]][j] += counts[node][j];
      }
    }
  }
  return ans;
}
