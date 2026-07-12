function longestArithSeqLength(nums: number[]): number {
  const n = nums.length;
  if (n <= 2) {
    return n;
  }
  const dp: Map<number, number>[] = Array.from(
    { length: n },
    () => new Map<number, number>(),
  );
  let ans = 2;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < i; j++) {
      const d = nums[i] - nums[j];
      const prev = dp[j].get(d) ?? 1;
      const current = prev + 1;
      dp[i].set(d, Math.max(dp[i].get(d) ?? 0, current));
      ans = Math.max(ans, dp[i].get(d)!);
    }
  }
  return ans;
}
