function maxAscendingSum(nums: number[]): number {
  let curr = nums[0],
    ans = nums[0];
  for (let i = 1; i < nums.length; i++) {
    curr = nums[i] > nums[i - 1] ? curr + nums[i] : nums[i];
    ans = Math.max(ans, curr);
  }
  return ans;
}
