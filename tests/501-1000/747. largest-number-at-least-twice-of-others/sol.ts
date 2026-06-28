function dominantIndex(nums: number[]): number {
  let m = -1;
  let s = -1;
  let idx = -1;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] > m) {
      s = m;
      m = nums[i];
      idx = i;
    } else if (nums[i] > s) {
      s = nums[i];
    }
  }
  return m >= s * 2 ? idx : -1;
}
