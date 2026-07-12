function repeatedNTimes(nums: number[]): number {
  const n = nums.length - 2;
  for (let i = 0; i < n; i++) {
    if (nums[i] === nums[i + 1] || nums[i] === nums[i + 2]) {
      return nums[i];
    }
  }
  return nums[n + 1];
}
