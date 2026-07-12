function minIncrementForUnique(nums: number[]): number {
  nums.sort((a, b) => a - b);
  let res = 0;
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] <= nums[i - 1]) {
      const target = nums[i - 1] + 1;
      res += target - nums[i];
      nums[i] = target;
    }
  }
  return res;
}
