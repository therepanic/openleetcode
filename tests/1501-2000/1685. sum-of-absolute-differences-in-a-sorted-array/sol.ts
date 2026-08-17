function getSumAbsoluteDifferences(nums: number[]): number[] {
  const n = nums.length;
  const pref: number[] = new Array(n);
  pref[0] = nums[0];
  for (let i = 1; i < n; i++) pref[i] = pref[i - 1] + nums[i];
  const ans: number[] = [];
  for (let i = 0; i < n; i++) {
    const left = i > 0 ? pref[i - 1] : 0;
    const right = pref[n - 1] - pref[i];
    ans.push(right - left + (2 * i - n + 1) * nums[i]);
  }
  return ans;
}
