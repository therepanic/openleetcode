function maximumScore(nums: number[], k: number): number {
  const n = nums.length;
  let i = k,
    j = k;
  let curMin = nums[k];
  let res = curMin;

  while (i > 0 || j < n - 1) {
    if (i === 0) {
      j++;
    } else if (j === n - 1) {
      i--;
    } else if (nums[i - 1] >= nums[j + 1]) {
      i--;
    } else {
      j++;
    }
    curMin = Math.min(curMin, nums[i], nums[j]);
    res = Math.max(res, curMin * (j - i + 1));
  }

  return res;
}
