function minElements(nums: number[], limit: number, goal: number): number {
  const currentSum = nums.reduce((a, b) => a + b, 0);
  const diff = Math.abs(goal - currentSum);
  return Math.ceil(diff / limit);
}
