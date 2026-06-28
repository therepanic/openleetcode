function maxSumOfThreeSubarrays(nums: number[], k: number): number[] {
  const n = nums.length;
  let sum1 = nums.slice(0, k).reduce((a, b) => a + b, 0);
  let sum2 = nums.slice(k, 2 * k).reduce((a, b) => a + b, 0);
  let sum3 = nums.slice(2 * k, 3 * k).reduce((a, b) => a + b, 0);

  let max1 = sum1;
  let max12 = sum1 + sum2;
  let max123 = sum1 + sum2 + sum3;

  let index1 = 0;
  let index12_1 = 0;
  let index12_2 = k;
  let ans = [0, k, 2 * k];

  for (let i = 1; i <= n - 3 * k; i++) {
    sum1 = sum1 - nums[i - 1] + nums[i + k - 1];
    sum2 = sum2 - nums[i + k - 1] + nums[i + 2 * k - 1];
    sum3 = sum3 - nums[i + 2 * k - 1] + nums[i + 3 * k - 1];

    if (sum1 > max1) {
      max1 = sum1;
      index1 = i;
    }

    if (max1 + sum2 > max12) {
      max12 = max1 + sum2;
      index12_1 = index1;
      index12_2 = i + k;
    }

    if (max12 + sum3 > max123) {
      max123 = max12 + sum3;
      ans = [index12_1, index12_2, i + 2 * k];
    }
  }

  return ans;
}
