function checkSubarraySum(nums: number[], k: number): boolean {
  if (nums.length === 0) return false;

  let prefixSum = 0;
  const remainderMap = new Map<number, number>();
  remainderMap.set(0, -1);

  for (let i = 0; i < nums.length; i++) {
    prefixSum += nums[i];
    const remainder = prefixSum % k;

    if (remainderMap.has(remainder)) {
      if (i - remainderMap.get(remainder)! > 1) return true;
    } else {
      remainderMap.set(remainder, i);
    }
  }

  return false;
}
