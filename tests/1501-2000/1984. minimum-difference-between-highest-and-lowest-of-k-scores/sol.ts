function minimumDifference(nums: number[], k: number): number {
  nums.sort((a, b) => a - b);
  const n = nums.length;
  let ans = nums[k - 1] - nums[0];
  for (let i = 0; i <= n - k; i++) {
    ans = Math.min(ans, nums[i + k - 1] - nums[i]);
  }
  return ans;
}
