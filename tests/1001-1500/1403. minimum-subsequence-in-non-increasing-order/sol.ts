function minSubsequence(nums: number[]): number[] {
  nums.sort((a, b) => a - b);
  const v: number[] = [];
  let l = nums.length;
  let sumV = 0,
    sumRem = nums.reduce((a, b) => a + b, 0);
  while (sumV <= sumRem) {
    l--;
    sumV += nums[l];
    sumRem -= nums[l];
    v.push(nums[l]);
  }
  return v;
}
