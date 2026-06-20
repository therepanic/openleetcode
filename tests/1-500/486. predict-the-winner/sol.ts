function predictTheWinner(nums: number[]): boolean {
  const helper = (left: number, right: number): number => {
    if (left === right) {
      return nums[left];
    }
    return Math.max(
      nums[left] - helper(left + 1, right),
      nums[right] - helper(left, right - 1),
    );
  };
  return helper(0, nums.length - 1) >= 0;
}
