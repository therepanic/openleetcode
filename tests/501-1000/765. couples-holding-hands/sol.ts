function minSwapsCouples(row: number[]): number {
  const n = row.length / 2;
  const parent: number[] = Array.from({ length: n }, (_, i) => i);

  function find(x: number): number {
    if (parent[x] !== x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  function union(a: number, b: number): void {
    const pa = find(a);
    const pb = find(b);
    if (pa !== pb) {
      parent[pa] = pb;
    }
  }

  for (let i = 0; i < row.length; i += 2) {
    const couple1 = Math.floor(row[i] / 2);
    const couple2 = Math.floor(row[i + 1] / 2);
    union(couple1, couple2);
  }

  const componentSize: Map<number, number> = new Map();
  for (let couple = 0; couple < n; couple++) {
    const root = find(couple);
    componentSize.set(root, (componentSize.get(root) || 0) + 1);
  }

  let swaps = 0;
  for (const size of componentSize.values()) {
    swaps += size - 1;
  }

  return swaps;
}
