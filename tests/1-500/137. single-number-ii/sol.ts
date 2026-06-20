function singleNumber(nums: number[]): number {
  let totalSum = 0;
  const seen = new Set<number>();
  for (const num of nums) {
    totalSum += num;
    seen.add(num);
  }
  let uniqueSum = 0;
  for (const num of seen) {
    uniqueSum += num;
  }
  return ((3 * uniqueSum - totalSum) >> 1) | 0;
}
