function findPairs(nums: number[], k: number): number {
  if (k < 0) return 0;
  let count = 0;
  const numCounts = new Map<number, number>();
  for (const num of nums) {
    numCounts.set(num, (numCounts.get(num) || 0) + 1);
  }
  for (const [num, freq] of numCounts) {
    if (k === 0) {
      if (freq >= 2) count++;
    } else {
      if (numCounts.has(num + k)) count++;
    }
  }
  return count;
}
