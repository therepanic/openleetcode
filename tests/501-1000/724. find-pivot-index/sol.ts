function pivotIndex(nums: number[]): number {
  const totalSum = nums.reduce((a, b) => a + b, 0);
  let lSum = 0;
  let rSum = totalSum;
  for (let i = 0; i < nums.length; i++) {
    rSum -= nums[i];
    if (lSum === rSum) {
      return i;
    }
    lSum += nums[i];
  }
  return -1;
}
