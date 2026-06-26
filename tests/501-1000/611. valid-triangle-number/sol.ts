function triangleNumber(nums: number[]): number {
  nums.sort((a, b) => a - b);
  const n = nums.length;
  let count = 0;
  for (let i = n - 1; i >= 0; i--) {
    let left = 0,
      right = i - 1;
    while (left < right) {
      if (nums[left] + nums[right] > nums[i]) {
        count += right - left;
        right--;
      } else {
        left++;
      }
    }
  }
  return count;
}
