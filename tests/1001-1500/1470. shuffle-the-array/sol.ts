function shuffle(nums: number[], n: number): number[] {
  const ans: number[] = new Array(2 * n);
  for (let i = 0; i < 2 * n; i++) {
    if (i % 2 === 0) {
      ans[i] = nums[(i / 2) | 0];
    } else {
      ans[i] = nums[n + ((i / 2) | 0)];
    }
  }
  return ans;
}
