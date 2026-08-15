function minimumHammingDistance(
  source: number[],
  target: number[],
  allowedSwaps: number[][],
): number {
  const n = source.length;
  const parent: number[] = Array.from({ length: n }, (_, i) => i);

  function find(x: number): number {
    if (parent[x] !== x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  function unite(a: number, b: number): void {
    parent[find(a)] = find(b);
  }

  for (const [a, b] of allowedSwaps) {
    unite(a, b);
  }

  const groups: Map<number, number[]> = new Map();
  for (let i = 0; i < n; i++) {
    const root = find(i);
    if (!groups.has(root)) groups.set(root, []);
    groups.get(root)!.push(source[i]);
  }
  const freqMap: Map<number, Map<number, number>> = new Map();
  for (const [root, vals] of groups) {
    const freq = new Map<number, number>();
    for (const v of vals) {
      freq.set(v, (freq.get(v) || 0) + 1);
    }
    freqMap.set(root, freq);
  }

  let hammingDist = 0;
  for (let i = 0; i < n; i++) {
    const root = find(i);
    const freq = freqMap.get(root)!;
    const val = target[i];
    const count = freq.get(val) || 0;
    if (count > 0) {
      freq.set(val, count - 1);
    } else {
      hammingDist++;
    }
  }
  return hammingDist;
}
