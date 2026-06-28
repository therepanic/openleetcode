function checkPossibility(nums: number[]): boolean {
  let cntViolations = 0;
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] < nums[i - 1]) {
      if (cntViolations === 1) {
        return false;
      }
      cntViolations++;
      if (i >= 2 && nums[i - 2] > nums[i]) {
        nums[i] = nums[i - 1];
      }
    }
  }
  return true;
}
