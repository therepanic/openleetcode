function findCriticalAndPseudoCriticalEdges(
  n: number,
  edges: number[][],
): number[][] {
  class UnionFind {
    parent: number[];
    constructor(n: number) {
      this.parent = Array.from({ length: n }, (_, i) => i);
    }
    findParent(p: number): number {
      if (this.parent[p] === p) return p;
      this.parent[p] = this.findParent(this.parent[p]);
      return this.parent[p];
    }
    union(u: number, v: number): void {
      const pu = this.findParent(u);
      const pv = this.findParent(v);
      this.parent[pu] = pv;
    }
  }

  const findMST = (block: number, e: number): number => {
    const uf = new UnionFind(n);
    let weight = 0;
    if (e !== -1) {
      weight += edges[e][2];
      uf.union(edges[e][0], edges[e][1]);
    }
    for (let i = 0; i < edges.length; i++) {
      if (i === block) continue;
      if (uf.findParent(edges[i][0]) === uf.findParent(edges[i][1])) continue;
      uf.union(edges[i][0], edges[i][1]);
      weight += edges[i][2];
    }
    for (let i = 0; i < n; i++) {
      if (uf.findParent(i) !== uf.findParent(0)) return Infinity;
    }
    return weight;
  };

  for (let i = 0; i < edges.length; i++) {
    edges[i].push(i);
  }
  edges.sort((a, b) => a[2] - b[2]);
  const mstwt = findMST(-1, -1);
  const critical: number[] = [];
  const pseudoCritical: number[] = [];
  for (let i = 0; i < edges.length; i++) {
    if (mstwt < findMST(i, -1)) {
      critical.push(edges[i][3]);
    } else if (mstwt === findMST(-1, i)) {
      pseudoCritical.push(edges[i][3]);
    }
  }
  return [critical, pseudoCritical];
}
