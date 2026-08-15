function getMaximumXor(nums: number[], maximumBit: number): number[] {
  const n = nums.length;
  const ans = new Array(n);
  const mask = (1 << maximumBit) - 1;
  let curr = 0;
  for (let i = 0; i < n; i++) {
    curr ^= nums[i];
    ans[n - 1 - i] = mask ^ curr;
  }
  return ans;
}
