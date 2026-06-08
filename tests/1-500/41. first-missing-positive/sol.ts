function firstMissingPositive(nums: number[]): number {
  const seen = new Set(nums);
  let i = 1;
  while (seen.has(i)) {
    i++;
  }
  return i;
}
