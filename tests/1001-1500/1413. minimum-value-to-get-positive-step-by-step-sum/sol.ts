function minStartValue(nums: number[]): number {
  let curr = 0,
    ans = 0;
  for (const i of nums) {
    curr += i;
    if (curr < ans) {
      ans = curr;
    }
  }
  return Math.max(ans, 1 - ans);
}
