function areConnected(
  n: number,
  threshold: number,
  queries: number[][],
): boolean[] {
  let limit = n;
  for (const q of queries) {
    limit = Math.max(limit, q[0], q[1]);
  }
  const parent: number[] = Array.from({ length: limit + 1 }, (_, i) => i);
  const rank: number[] = new Array(limit + 1).fill(1);

  const find = (x: number): number => {
    let res = x;
    while (res !== parent[res]) {
      parent[res] = parent[parent[res]];
      res = parent[res];
    }
    return res;
  };

  const union = (a: number, b: number): boolean => {
    const p1 = find(a);
    const p2 = find(b);
    if (p1 === p2) return false;
    if (rank[p1] > rank[p2]) {
      parent[p2] = p1;
      rank[p1] += rank[p2];
    } else {
      parent[p1] = p2;
      rank[p2] += rank[p1];
    }
    return true;
  };

  for (let i = threshold + 1; i <= limit; i++) {
    for (let j = 2 * i; j <= limit; j += i) {
      union(i, j);
    }
  }

  return queries.map(([x, y]) => find(x) === find(y));
}
