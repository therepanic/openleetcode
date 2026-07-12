function sumSubseqWidths(nums: number[]): number {
  const mod = 1000000007;
  nums.sort((a, b) => a - b);
  const n = nums.length;
  let ans = 0;
  let factor = 1;
  for (let i = 0; i < n; i++) {
    ans = (ans + (nums[i] - nums[n - 1 - i]) * factor) % mod;
    factor = (factor * 2) % mod;
  }
  return ans;
}
