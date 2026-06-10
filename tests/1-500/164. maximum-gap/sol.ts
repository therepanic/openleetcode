function maximumGap(nums: number[]): number {
  if (nums.length < 2) return 0;
  nums.sort((a, b) => a - b);
  let best = 0;
  for (let i = 1; i < nums.length; i++)
    best = Math.max(best, nums[i] - nums[i - 1]);
  return best;
}
