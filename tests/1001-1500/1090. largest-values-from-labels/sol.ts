function largestValsFromLabels(
  values: number[],
  labels: number[],
  numWanted: number,
  useLimit: number,
): number {
  const n = values.length;
  const pairs: [number, number][] = [];
  for (let i = 0; i < n; i++) {
    pairs.push([values[i], labels[i]]);
  }
  pairs.sort((a, b) => b[0] - a[0]);
  let res = 0;
  const freq: Map<number, number> = new Map();
  for (const [value, label] of pairs) {
    if (numWanted === 0) break;
    if (!freq.has(label) || freq.get(label)! < useLimit) {
      res += value;
      freq.set(label, (freq.get(label) || 0) + 1);
      numWanted--;
    }
  }
  return res;
}
