function minMoves2(nums: number[]): number {
  nums.sort((a, b) => a - b);
  const median = nums[Math.floor(nums.length / 2)];
  let moves = 0;
  for (const num of nums) {
    moves += Math.abs(num - median);
  }
  return moves;
}
