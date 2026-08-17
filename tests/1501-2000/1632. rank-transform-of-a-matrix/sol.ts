function matrixRankTransform(matrix: number[][]): number[][] {
  const m = matrix.length,
    n = matrix[0].length;
  const mp = new Map<number, [number, number][]>();
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      const v = matrix[i][j];
      if (!mp.has(v)) mp.set(v, []);
      mp.get(v)!.push([i, j]);
    }
  }

  const rank = new Array(m + n).fill(0);
  const ans: number[][] = Array.from({ length: m }, () => new Array(n).fill(0));

  const keys = Array.from(mp.keys()).sort((a, b) => a - b);
  for (const k of keys) {
    const parent = Array.from({ length: m + n }, (_, i) => i);
    const find = (p: number): number => {
      if (p !== parent[p]) parent[p] = find(parent[p]);
      return parent[p];
    };

    for (const [i, j] of mp.get(k)!) {
      const ii = find(i);
      const jj = find(m + j);
      parent[ii] = jj;
      rank[jj] = Math.max(rank[ii], rank[jj]);
    }

    const seen = new Set<number>();
    for (const [i, j] of mp.get(k)!) {
      const ii = find(i);
      if (!seen.has(ii)) rank[ii] += 1;
      seen.add(ii);
      const v = rank[ii];
      rank[i] = rank[m + j] = ans[i][j] = v;
    }
  }
  return ans;
}
