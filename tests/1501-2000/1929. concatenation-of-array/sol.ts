function getConcatenation(nums: number[]): number[] {
  const n = nums.length;
  const ans: number[] = new Array(2 * n).fill(0);
  for (let i = 0; i < 2 * n; i++) {
    ans[i] = nums[i % n];
  }
  return ans;
}
