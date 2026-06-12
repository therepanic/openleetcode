function findMin(nums: number[]): number {
  let left = 0,
    right = nums.length - 1;
  while (left < right) {
    const mid = left + ((right - left) >> 1);
    if (nums[mid] > nums[right]) left = mid + 1;
    else if (nums[mid] < nums[right]) right = mid;
    else right--;
  }
  return nums[left];
}
