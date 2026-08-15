function distanceLimitedPathsExist(
  n: number,
  edgeList: number[][],
  queries: number[][],
): boolean[] {
  const parent: number[] = Array.from({ length: n }, (_, i) => i);
  const rank: number[] = new Array(n).fill(0);

  const find = (start: number): number => {
    let x = start;
    while (parent[x] !== x) {
      parent[x] = parent[parent[x]];
      x = parent[x];
    }
    return x;
  };

  const union = (x: number, y: number): void => {
    const xroot = find(x);
    const yroot = find(y);
    if (xroot === yroot) return;
    if (rank[xroot] < rank[yroot]) {
      parent[xroot] = yroot;
    } else if (rank[xroot] > rank[yroot]) {
      parent[yroot] = xroot;
    } else {
      parent[yroot] = xroot;
      rank[xroot]++;
    }
  };

  // add index to queries
  const queriesWithIdx: number[][] = [];
  for (let i = 0; i < queries.length; i++) {
    queriesWithIdx.push([queries[i][0], queries[i][1], queries[i][2], i]);
  }

  queriesWithIdx.sort((a, b) => a[2] - b[2]);
  edgeList.sort((a, b) => a[2] - b[2]);

  let idx = 0;
  const res: boolean[] = new Array(queries.length).fill(false);
  for (const q of queriesWithIdx) {
    while (idx < edgeList.length && edgeList[idx][2] < q[2]) {
      union(edgeList[idx][0], edgeList[idx][1]);
      idx++;
    }
    if (find(q[0]) === find(q[1])) {
      res[q[3]] = true;
    }
  }
  return res;
}
