function numberOfArithmeticSlices(nums: number[]): number {
  const n = nums.length;
  let totalCount = 0;
  const dp: Map<number, number>[] = Array.from({ length: n }, () => new Map());

  for (let i = 1; i < n; i++) {
    for (let j = 0; j < i; j++) {
      const diff = nums[i] - nums[j];
      dp[i].set(diff, (dp[i].get(diff) || 0) + 1);
      if (dp[j].has(diff)) {
        const cnt = dp[j].get(diff)!;
        dp[i].set(diff, dp[i].get(diff)! + cnt);
        totalCount += cnt;
      }
    }
  }

  return totalCount;
}
