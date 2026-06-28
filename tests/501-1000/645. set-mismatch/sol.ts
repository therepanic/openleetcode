function findErrorNums(nums: number[]): number[] {
  let i = 0;
  while (i < nums.length) {
    const correct = nums[i] - 1;
    if (nums[i] !== nums[correct]) {
      [nums[i], nums[correct]] = [nums[correct], nums[i]];
    } else {
      i++;
    }
  }

  for (i = 0; i < nums.length; i++) {
    if (nums[i] !== i + 1) {
      return [nums[i], i + 1];
    }
  }
  return [];
}
