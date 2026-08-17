function buildArray(nums: number[]): number[] {
  for (let i = 0; i < nums.length; i++) {
    nums[i] += 1024 * (nums[nums[i]] % 1024);
  }

  for (let i = 0; i < nums.length; i++) {
    nums[i] = Math.floor(nums[i] / 1024);
  }

  return nums;
}
