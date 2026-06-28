function findUnsortedSubarray(nums: number[]): number {
  const sortedNums = [...nums].sort((a, b) => a - b);
  let start = nums.length,
    end = 0;

  for (let i = 0; i < nums.length; i++) {
    if (nums[i] !== sortedNums[i]) {
      start = Math.min(start, i);
      end = Math.max(end, i);
    }
  }

  return end - start >= 0 ? end - start + 1 : 0;
}
