function uniqueOccurrences(arr: number[]): boolean {
  const d: Map<number, number> = new Map();
  for (const i of arr) {
    if (d.has(i)) {
      d.set(i, d.get(i)! + 1);
    } else {
      d.set(i, 1);
    }
  }
  const s: Set<number> = new Set();
  for (const value of d.values()) {
    if (s.has(value)) {
      return false;
    }
    s.add(value);
  }
  return true;
}
