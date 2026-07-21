function kLengthApart(nums: number[], k: number): boolean {
  if (k === 0) {
    return true;
  }
  let prev: number | null = null;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === 1) {
      if (prev !== null && i - prev <= k) {
        return false;
      }
      prev = i;
    }
  }
  return true;
}
