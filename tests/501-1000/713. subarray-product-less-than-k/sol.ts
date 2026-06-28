function numSubarrayProductLessThanK(nums: number[], k: number): number {
  if (k <= 1) {
    return 0;
  }

  let left = 0;
  let product = 1;
  let ans = 0;

  for (let right = 0; right < nums.length; right++) {
    product *= nums[right];

    while (product >= k) {
      product = Math.floor(product / nums[left]);
      left++;
    }

    ans += right - left + 1;
  }

  return ans;
}
