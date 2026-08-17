function maxNumEdgesToRemove(n: number, edges: number[][]): number {
  edges.sort((a, b) => b[0] - a[0]);
  const parentA: number[] = Array.from({ length: n + 1 }, (_, i) => i);
  const parentB: number[] = Array.from({ length: n + 1 }, (_, i) => i);
  const rankA: number[] = new Array(n + 1).fill(0);
  const rankB: number[] = new Array(n + 1).fill(0);

  function find(parent: number[], x: number): number {
    if (parent[x] !== x) {
      parent[x] = find(parent, parent[x]);
    }
    return parent[x];
  }

  function union(
    parent: number[],
    rank: number[],
    x: number,
    y: number,
  ): boolean {
    const rootX = find(parent, x);
    const rootY = find(parent, y);
    if (rootX === rootY) return false;
    if (rank[rootX] < rank[rootY]) {
      parent[rootX] = rootY;
    } else if (rank[rootX] > rank[rootY]) {
      parent[rootY] = rootX;
    } else {
      parent[rootX] = rootY;
      rank[rootY]++;
    }
    return true;
  }

  let removed = 0;
  let aliceEdges = 0;
  let bobEdges = 0;
  for (const e of edges) {
    if (e[0] === 3) {
      if (union(parentA, rankA, e[1], e[2])) {
        union(parentB, rankB, e[1], e[2]);
        aliceEdges++;
        bobEdges++;
      } else {
        removed++;
      }
    } else if (e[0] === 2) {
      if (union(parentB, rankB, e[1], e[2])) {
        bobEdges++;
      } else {
        removed++;
      }
    } else {
      if (union(parentA, rankA, e[1], e[2])) {
        aliceEdges++;
      } else {
        removed++;
      }
    }
  }
  return bobEdges === n - 1 && aliceEdges === n - 1 ? removed : -1;
}
