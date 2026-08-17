function numSplits(s: string): number {
  const n = s.length;
  let counter = 0;
  const distinct_left: Map<string, number> = new Map();
  const distinct_right: Map<string, number> = new Map();

  for (const c of s) {
    distinct_right.set(c, (distinct_right.get(c) ?? 0) + 1);
  }
  for (let i = 0; i < n - 1; i++) {
    const c = s[i];
    distinct_left.set(c, (distinct_left.get(c) ?? 0) + 1);
    distinct_right.set(c, (distinct_right.get(c) ?? 0) - 1);
    if (distinct_right.get(c) === 0) {
      distinct_right.delete(c);
    }
    if (distinct_left.size === distinct_right.size) {
      counter++;
    }
  }

  return counter;
}
