function longestOnes(nums: number[], k: number): number {
  let left = 0,
    maxLength = 0,
    zeroCount = 0;
  for (let right = 0; right < nums.length; right++) {
    if (nums[right] === 0) {
      zeroCount++;
    }
    while (zeroCount > k) {
      if (nums[left] === 0) {
        zeroCount--;
      }
      left++;
    }
    maxLength = Math.max(maxLength, right - left + 1);
  }
  return maxLength;
}
