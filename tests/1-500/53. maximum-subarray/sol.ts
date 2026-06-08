function maxSubArray(nums: number[]): number {
  let best = nums[0];
  let cur = 0;
  for (const n of nums) {
    if (cur < 0) cur = 0;
    cur += n;
    if (cur > best) best = cur;
  }
  return best;
}
