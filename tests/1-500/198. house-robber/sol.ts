function rob(nums: number[]): number {
  let next1 = 0;
  let next2 = 0;
  for (let i = nums.length - 1; i >= 0; i--) {
    const curr = Math.max(nums[i] + next2, next1);
    next2 = next1;
    next1 = curr;
  }
  return next1;
}
