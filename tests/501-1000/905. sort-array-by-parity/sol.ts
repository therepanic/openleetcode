function sortArrayByParity(nums: number[]): number[] {
  let left = 0;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] % 2 === 0) {
      [nums[left], nums[i]] = [nums[i], nums[left]];
      left++;
    }
  }
  return nums;
}
