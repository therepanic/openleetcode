function numSubarrayBoundedMax(
  nums: number[],
  left: number,
  right: number,
): number {
  let res = 0,
    dp = 0,
    prev = -1;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] < left && i > 0) {
      res += dp;
    }
    if (nums[i] > right) {
      dp = 0;
      prev = i;
    }
    if (left <= nums[i] && nums[i] <= right) {
      dp = i - prev;
      res += dp;
    }
  }
  return res;
}
