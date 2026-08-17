function restoreArray(adjacentPairs: number[][]): number[] {
  const xorMap: Map<number, number> = new Map();
  const degree: Map<number, number> = new Map();

  for (const [u, v] of adjacentPairs) {
    xorMap.set(u, (xorMap.get(u) ?? 0) ^ v);
    xorMap.set(v, (xorMap.get(v) ?? 0) ^ u);
    degree.set(u, (degree.get(u) ?? 0) + 1);
    degree.set(v, (degree.get(v) ?? 0) + 1);
  }

  let start = 0;
  for (const [key, value] of degree) {
    if (value === 1) {
      start = key;
      break;
    }
  }

  const n = adjacentPairs.length + 1;
  const res: number[] = new Array(n).fill(0);

  res[0] = start;
  let prev = 0;

  for (let i = 1; i < n; i++) {
    res[i] = (xorMap.get(res[i - 1]) ?? 0) ^ prev;
    prev = res[i - 1];
  }

  return res;
}
