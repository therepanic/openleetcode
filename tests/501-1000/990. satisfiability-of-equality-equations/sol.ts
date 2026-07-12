function equationsPossible(equations: string[]): boolean {
  const parent: number[] = Array.from({ length: 26 }, (_, i) => i);
  const rank: number[] = Array(26).fill(0);

  function find(x: number): number {
    if (parent[x] !== x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  function union(a: number, b: number): void {
    const ra = find(a);
    const rb = find(b);
    if (ra === rb) return;
    if (rank[ra] < rank[rb]) {
      parent[ra] = rb;
    } else if (rank[ra] > rank[rb]) {
      parent[rb] = ra;
    } else {
      parent[rb] = ra;
      rank[ra]++;
    }
  }

  for (const eq of equations) {
    if (eq[1] === "=") {
      union(
        eq.charCodeAt(0) - "a".charCodeAt(0),
        eq.charCodeAt(3) - "a".charCodeAt(0),
      );
    }
  }

  for (const eq of equations) {
    if (
      eq[1] === "!" &&
      find(eq.charCodeAt(0) - "a".charCodeAt(0)) ===
        find(eq.charCodeAt(3) - "a".charCodeAt(0))
    ) {
      return false;
    }
  }
  return true;
}
