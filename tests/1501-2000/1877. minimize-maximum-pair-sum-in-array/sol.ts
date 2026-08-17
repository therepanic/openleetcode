function minPairSum(nums: number[]): number {
  nums.sort((a, b) => a - b);
  let maxSum = 0;
  let l = 0,
    r = nums.length - 1;
  while (l < r) {
    maxSum = Math.max(maxSum, nums[l] + nums[r]);
    l++;
    r--;
  }
  return maxSum;
}
