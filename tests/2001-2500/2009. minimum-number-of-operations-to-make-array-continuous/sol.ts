function minOperations(nums: number[]): number {
  const length = nums.length;
  let minOps = length;
  const uniqueNums = [...new Set(nums)].sort((a, b) => a - b);
  let right = 0;

  for (let left = 0; left < uniqueNums.length; left++) {
    while (
      right < uniqueNums.length &&
      uniqueNums[right] < uniqueNums[left] + length
    ) {
      right++;
    }

    minOps = Math.min(minOps, length - (right - left));
  }

  return minOps;
}
