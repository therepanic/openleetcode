function maxSumDivThree(nums: number[]): number {
  const n = nums.length;
  const minus = -(1 << 30);
  const dp: number[][] = [
    [0, 0, 0],
    [0, minus, minus],
  ];
  for (let i = 0; i < n; i++) {
    const x = nums[i];
    const x3 = x % 3;
    for (let mod = 0; mod < 3; mod++) {
      const modPrev = (3 + mod - x3) % 3;
      const take = x + dp[(i + 1) & 1][modPrev];
      const skip = dp[(i + 1) & 1][mod];
      dp[i & 1][mod] = Math.max(take, skip);
    }
  }
  return Math.max(0, dp[(n - 1) & 1][0]);
}
