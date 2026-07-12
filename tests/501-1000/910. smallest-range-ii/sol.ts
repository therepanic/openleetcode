function smallestRangeII(nums: number[], k: number): number {
  nums.sort((a, b) => a - b);
  const n = nums.length;
  let ans = nums[n - 1] - nums[0];
  for (let i = 0; i < n - 1; i++) {
    const high = Math.max(nums[n - 1] - k, nums[i] + k);
    const low = Math.min(nums[0] + k, nums[i + 1] - k);
    ans = Math.min(ans, high - low);
  }
  return ans;
}
