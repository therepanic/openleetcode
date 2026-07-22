function makeConnected(n: number, connections: number[][]): number {
  if (connections.length < n - 1) {
    return -1;
  }

  const parent: number[] = Array.from({ length: n }, (_, i) => i);
  const size: number[] = Array(n).fill(1);

  const find = (node: number): number => {
    if (parent[node] !== node) {
      parent[node] = find(parent[node]);
    }
    return parent[node];
  };

  const union = (u: number, v: number): void => {
    const pu = find(u);
    const pv = find(v);
    if (pu === pv) return;
    if (size[pu] < size[pv]) {
      parent[pu] = pv;
      size[pv] += size[pu];
    } else {
      parent[pv] = pu;
      size[pu] += size[pv];
    }
  };

  let extra = 0;
  for (const [u, v] of connections) {
    if (find(u) === find(v)) {
      extra++;
    } else {
      union(u, v);
    }
  }

  let components = 0;
  for (let i = 0; i < n; i++) {
    if (find(i) === i) {
      components++;
    }
  }

  return extra >= components - 1 ? components - 1 : -1;
}
