function findRedundantDirectedConnection(edges: number[][]): number[] {
  const n = edges.length;
  const ufParent: number[] = Array.from({ length: n + 1 }, (_, i) => i);
  const rank: number[] = new Array(n + 1).fill(0);
  const parentArr: number[] = new Array(n + 1).fill(0);

  const find = (u: number): number => {
    if (ufParent[u] !== u) {
      ufParent[u] = find(ufParent[u]);
    }
    return ufParent[u];
  };

  const union = (u: number, v: number): boolean => {
    const pu = find(u);
    const pv = find(v);
    if (pu === pv) return false;
    if (rank[pu] < rank[pv]) {
      ufParent[pu] = pv;
    } else if (rank[pv] < rank[pu]) {
      ufParent[pv] = pu;
    } else {
      ufParent[pu] = pv;
      rank[pv]++;
    }
    return true;
  };

  let candidate1: number[] | null = null;
  let candidate2: number[] | null = null;

  for (const [u, v] of edges) {
    if (parentArr[v] !== 0) {
      candidate1 = [parentArr[v], v];
      candidate2 = [u, v];
      break;
    }
    parentArr[v] = u;
  }

  for (const [u, v] of edges) {
    if (candidate2 && u === candidate2[0] && v === candidate2[1]) {
      continue;
    }
    if (!union(u, v)) {
      return candidate1 ? candidate1 : [u, v];
    }
  }

  return candidate2!;
}
