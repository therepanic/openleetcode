function numIdenticalPairs(nums: number[]): number {
  const pairs: { [key: number]: number } = {};
  let count = 0;
  for (const num of nums) {
    if (pairs[num] !== undefined) {
      count += pairs[num];
    }
    pairs[num] = (pairs[num] || 0) + 1;
  }
  return count;
}
