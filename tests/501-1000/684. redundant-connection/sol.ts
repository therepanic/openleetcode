function findRedundantConnection(edges: number[][]): number[] {
  const n = edges.length;
  const matrix: number[][] = Array.from({ length: n + 1 }, () => []);
  for (const [a, b] of edges) {
    matrix[a].push(b);
    matrix[b].push(a);
  }

  const visited = new Set<number>();
  const path = new Set<number>();
  let cycleStart = -1;

  const dfs = (i: number, parent: number): boolean => {
    if (visited.has(i)) return false;
    visited.add(i);
    for (const node of matrix[i]) {
      if (!visited.has(node)) {
        if (dfs(node, i)) {
          if (cycleStart !== -1) {
            path.add(node);
          }
          if (node === cycleStart) {
            cycleStart = -1;
          }
          return true;
        }
      } else if (node !== parent) {
        path.add(node);
        cycleStart = node;
        return true;
      }
    }
    return false;
  };

  for (let i = n; i >= 1; i--) {
    if (dfs(i, -1)) break;
  }

  for (let k = n - 1; k >= 0; k--) {
    const [a, b] = edges[k];
    if (path.has(a) && path.has(b)) {
      return [a, b];
    }
  }
  return [];
}
