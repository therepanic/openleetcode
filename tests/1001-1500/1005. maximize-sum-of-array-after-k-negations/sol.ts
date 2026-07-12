function largestSumAfterKNegations(nums: number[], k: number): number {
  nums.sort((a, b) => a - b);
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] < 0 && k > 0) {
      nums[i] = -nums[i];
      k--;
    }
  }
  nums.sort((a, b) => a - b);
  if (k > 0 && k % 2 !== 0) {
    nums[0] = -nums[0];
  }
  return nums.reduce((a, b) => a + b, 0);
}
