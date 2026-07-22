function longestSubarray(nums: number[]): number {
  let left = 0,
    zeros = 0,
    res = 0;
  for (let right = 0; right < nums.length; right++) {
    if (nums[right] === 0) zeros++;
    while (zeros > 1) {
      if (nums[left] === 0) zeros--;
      left++;
    }
    res = Math.max(res, right - left);
  }
  return res;
}
