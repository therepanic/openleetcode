function subsetXORSum(nums: number[]): number {
  let total = 0;
  for (const num of nums) {
    total |= num;
  }
  return total * (1 << (nums.length - 1));
}
