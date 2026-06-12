function findPeakElement(nums: number[]): number {
  const n = nums.length;
  if (n < 3) {
    return nums[0] >= nums[n - 1] ? 0 : n - 1;
  }
  let left = 0,
    right = nums.length - 1;
  while (left < right) {
    const mid = left + ((right - left) >> 1);
    if (
      mid > 0 &&
      mid < n - 1 &&
      nums[mid - 1] < nums[mid] &&
      nums[mid] > nums[mid + 1]
    ) {
      return mid;
    }
    if (nums[mid] < nums[mid + 1]) left = mid + 1;
    else right = mid;
  }
  return left;
}
