function maxProduct(nums: number[]): number {
  let best = nums[0],
    curMax = nums[0],
    curMin = nums[0];
  for (let i = 1; i < nums.length; i++) {
    const x = nums[i];
    if (x < 0) {
      const tmp = curMax;
      curMax = curMin;
      curMin = tmp;
    }
    curMax = Math.max(x, curMax * x);
    curMin = Math.min(x, curMin * x);
    best = Math.max(best, curMax);
  }
  return best;
}
