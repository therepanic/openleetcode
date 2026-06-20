function findMaxConsecutiveOnes(nums: number[]): number {
  let res = 0;
  let left = 0;
  for (let right = 0; right < nums.length; right++) {
    if (nums[right] === 0) {
      left = right + 1;
    } else {
      res = Math.max(res, right - left + 1);
    }
  }
  return res;
}
