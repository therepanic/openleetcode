function smallestStringWithSwaps(s: string, pairs: number[][]): string {
  const n = s.length;
  const parent: number[] = Array.from({ length: n }, (_, i) => i);

  function find(x: number): number {
    if (parent[x] !== x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  function union(x: number, y: number): void {
    const rx = find(x);
    const ry = find(y);
    if (rx !== ry) {
      parent[rx] = ry;
    }
  }

  for (const [i, j] of pairs) {
    union(i, j);
  }

  const groups = new Map<number, number[]>();
  for (let i = 0; i < n; i++) {
    const root = find(i);
    if (!groups.has(root)) {
      groups.set(root, []);
    }
    groups.get(root)!.push(i);
  }

  const res: string[] = new Array(n);
  for (const indices of groups.values()) {
    const chars = indices.map((i) => s[i]);
    indices.sort((a, b) => a - b);
    chars.sort();
    for (let k = 0; k < indices.length; k++) {
      res[indices[k]] = chars[k];
    }
  }

  return res.join("");
}
