function stoneGameVIII(stones: number[]): number {
  const n = stones.length;
  const prefix = stones.slice();
  for (let i = 1; i < n; i++) {
    prefix[i] += prefix[i - 1];
  }
  let best = prefix[n - 1];
  for (let i = n - 2; i >= 1; i--) {
    best = Math.max(best, prefix[i] - best);
  }
  return best;
}
