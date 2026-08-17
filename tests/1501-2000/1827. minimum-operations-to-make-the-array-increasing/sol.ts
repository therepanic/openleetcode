function minOperations(nums: number[]): number {
  let c = nums[0];
  let s = 0;
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] > c) {
      c = nums[i];
    } else {
      c++;
      s += c - nums[i];
    }
  }
  return s;
}
