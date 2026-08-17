function maxAbsoluteSum(nums: number[]): number {
  let prefixSum = 0;
  let minPrefixSum = 0;
  let maxPrefixSum = 0;
  let maxAbsoluteSum = 0;

  for (const num of nums) {
    prefixSum += num;

    maxAbsoluteSum = Math.max(
      maxAbsoluteSum,
      Math.abs(prefixSum - minPrefixSum),
    );
    maxAbsoluteSum = Math.max(
      maxAbsoluteSum,
      Math.abs(prefixSum - maxPrefixSum),
    );

    minPrefixSum = Math.min(minPrefixSum, prefixSum);
    maxPrefixSum = Math.max(maxPrefixSum, prefixSum);
  }

  return maxAbsoluteSum;
}
