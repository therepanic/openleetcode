function longestConsecutive(nums: number[]): number {
  const seen = new Set(nums);
  let best = 0;
  for (const num of seen) {
    if (seen.has(num - 1)) continue;
    let current = num;
    let streak = 1;
    while (seen.has(current + 1)) {
      current++;
      streak++;
    }
    best = Math.max(best, streak);
  }
  return best;
}
