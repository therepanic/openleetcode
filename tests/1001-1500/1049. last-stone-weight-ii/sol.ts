function lastStoneWeightII(stones: number[]): number {
  const n = stones.length;
  const total = stones.reduce((a, b) => a + b, 0);
  const target = Math.floor(total / 2);
  let dp_prev: number[] = new Array(target + 1).fill(0);
  for (let i = n - 1; i >= 0; i--) {
    const dp_curr: number[] = new Array(target + 1).fill(0);
    for (let size = 0; size <= target; size++) {
      const skip = dp_prev[size];
      const take =
        size >= stones[i] ? dp_prev[size - stones[i]] + stones[i] : -Infinity;
      dp_curr[size] = Math.max(skip, take);
    }
    dp_prev = dp_curr;
  }
  return total - 2 * dp_prev[target];
}
