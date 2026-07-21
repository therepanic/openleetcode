function findLeastNumOfUniqueInts(arr: number[], k: number): number {
  const counts: Map<number, number> = new Map();
  for (const num of arr) {
    counts.set(num, (counts.get(num) || 0) + 1);
  }
  let remaining = counts.size;
  const frequencies = Array.from(counts.values()).sort((a, b) => a - b);
  for (const count of frequencies) {
    if (k < count) {
      break;
    }
    k -= count;
    remaining--;
  }
  return remaining;
}
