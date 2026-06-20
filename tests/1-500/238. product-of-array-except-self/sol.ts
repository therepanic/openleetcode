function productExceptSelf(nums: number[]): number[] {
  const n = nums.length;
  const res: number[] = new Array(n);

  let pre = 1;
  for (let i = 0; i < n; i++) {
    res[i] = pre;
    pre *= nums[i];
  }

  let suf = 1;
  for (let i = n - 1; i >= 0; i--) {
    res[i] *= suf;
    suf *= nums[i];
  }

  return res;
}
