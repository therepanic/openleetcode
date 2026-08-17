function arraySign(nums: number[]): number {
  if (nums.includes(0)) return 0;
  const negatives = nums.filter((num) => num < 0).length;
  return negatives % 2 === 0 ? 1 : -1;
}
