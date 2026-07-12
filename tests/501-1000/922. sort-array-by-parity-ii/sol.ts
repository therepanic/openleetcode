function sortArrayByParityII(nums: number[]): number[] {
  let i = 0,
    j = 1;
  const n = nums.length;

  while (i < n && j < n) {
    if (nums[i] % 2 === 0) {
      i += 2;
    } else if (nums[j] % 2 === 1) {
      j += 2;
    } else {
      const temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
      i += 2;
      j += 2;
    }
  }
  return nums;
}
