function sumOfBeauties(nums: number[]): number {
  const n = nums.length;
  const prefix: number[] = new Array(n).fill(0);
  const suffix: number[] = new Array(n).fill(0);
  prefix[0] = nums[0];
  suffix[n - 1] = nums[n - 1];
  for (let i = 1; i < n; i++) {
    prefix[i] = Math.max(nums[i - 1], prefix[i - 1]);
  }
  for (let i = n - 2; i >= 0; i--) {
    suffix[i] = Math.min(nums[i + 1], suffix[i + 1]);
  }
  let ans = 0;
  for (let i = 1; i < n - 1; i++) {
    if (prefix[i] < nums[i] && nums[i] < suffix[i]) {
      ans += 2;
    } else if (nums[i - 1] < nums[i] && nums[i] < nums[i + 1]) {
      ans += 1;
    }
  }
  return ans;
}
