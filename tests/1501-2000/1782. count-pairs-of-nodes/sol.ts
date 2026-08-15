function countPairs(n: number, edges: number[][], queries: number[]): number[] {
  const x: Map<number, Set<number>> = new Map();
  const edge: number[] = new Array(n).fill(0);
  const edgePair: Map<string, number> = new Map();

  for (const [a, b] of edges) {
    const i = a - 1;
    const j = b - 1;
    if (!x.has(i)) x.set(i, new Set());
    if (!x.has(j)) x.set(j, new Set());
    x.get(i)!.add(j);
    x.get(j)!.add(i);
    edge[i]++;
    edge[j]++;
    const key1 = `${i},${j}`;
    const key2 = `${j},${i}`;
    edgePair.set(key1, (edgePair.get(key1) || 0) + 1);
    edgePair.set(key2, (edgePair.get(key2) || 0) + 1);
  }

  const res = [...edge].sort((a, b) => a - b);

  function binse(threshold: number): number {
    let i = 0;
    let j = n - 1;
    let ans = n;
    while (i <= j) {
      const mid = Math.floor((i + j) / 2);
      if (res[mid] > threshold) {
        ans = mid;
        j = mid - 1;
      } else {
        i = mid + 1;
      }
    }
    return n - ans;
  }

  const result: number[] = [];
  for (const query of queries) {
    const v = new Set<number>();
    let ans = 0;

    function f(i: number) {
      v.add(i);
      let a = binse(query - edge[i]);

      if (edge[i] > query - edge[i]) {
        a--;
      }

      for (const j of x.get(i) || []) {
        if (
          edge[j] > query - edge[i] &&
          edge[j] - (edgePair.get(`${i},${j}`) || 0) <= query - edge[i]
        ) {
          a--;
        }
        if (!v.has(j)) {
          f(j);
        }
      }
      ans += a;
    }

    for (let j = 0; j < n; j++) {
      if (!v.has(j)) {
        f(j);
      }
    }
    result.push(Math.floor(ans / 2));
  }

  return result;
}
