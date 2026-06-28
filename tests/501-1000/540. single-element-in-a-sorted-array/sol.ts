function singleNonDuplicate(nums: number[]): number {
  let left = 0,
    right = nums.length - 1;

  while (left < right) {
    let mid = left + Math.floor((right - left) / 2);

    if (mid % 2 === 1) {
      mid--;
    }

    if (nums[mid] === nums[mid + 1]) {
      left = mid + 2;
    } else {
      right = mid;
    }
  }

  return nums[left];
}
