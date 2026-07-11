function smallestRangeI(nums: number[], k: number): number {
  let minVal = nums[0];
  let maxVal = nums[0];

  for (const val of nums) {
    if (val < minVal) {
      minVal = val;
    } else if (val > maxVal) {
      maxVal = val;
    }
  }

  return Math.max(0, maxVal - minVal - k * 2);
}
