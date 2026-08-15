function minOperations(nums: number[], x: number): number {
  let sub_sum = nums.reduce((a, b) => a + b, 0) - x;
  const n = nums.length;
  let opes = n;
  if (sub_sum === 0) return n;
  let l = 0,
    r = 0,
    sld_sum = 0;

  while (r < n) {
    if (sld_sum === sub_sum) {
      opes = Math.min(opes, n - (r - l));
    }
    sld_sum += nums[r];
    while (l < r && sld_sum > sub_sum) {
      sld_sum -= nums[l];
      l++;
    }
    r++;
  }

  if (sld_sum === sub_sum) {
    opes = Math.min(opes, n - (r - l));
  }

  return opes === n ? -1 : opes;
}
