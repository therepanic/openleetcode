function findMiddleIndex(nums: number[]): number {
  const total = nums.reduce((a, b) => a + b, 0);
  let leftSum = 0;
  let rightSum = total;

  for (let i = 0; i < nums.length; i++) {
    rightSum -= nums[i];
    if (leftSum === rightSum) return i;
    leftSum += nums[i];
  }

  return -1;
}
