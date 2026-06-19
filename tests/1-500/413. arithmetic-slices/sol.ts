function numberOfArithmeticSlices(nums: number[]): number {
  let c = 0;
  let t = 2;
  for (let i = 1; i < nums.length - 1; i++) {
    if (nums[i - 1] - nums[i] === nums[i] - nums[i + 1]) {
      t++;
    } else {
      t = 2;
    }
    c += t - 2;
  }
  return c;
}
