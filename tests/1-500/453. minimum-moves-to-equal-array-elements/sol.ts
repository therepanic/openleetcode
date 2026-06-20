function minMoves(nums: number[]): number {
  const sum = nums.reduce((a, b) => a + b, 0);
  const min = Math.min(...nums);
  return sum - nums.length * min;
}
