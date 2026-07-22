function numSubseq(nums: number[], target: number): number {
  const mod = 1000000007;
  nums.sort((a, b) => a - b);
  const n = nums.length;

  const power: number[] = new Array(n);
  power[0] = 1;
  for (let i = 1; i < n; i++) {
    power[i] = (power[i - 1] * 2) % mod;
  }

  let left = 0,
    right = n - 1;
  let result = 0;

  while (left <= right) {
    if (nums[left] + nums[right] <= target) {
      result = (result + power[right - left]) % mod;
      left++;
    } else {
      right--;
    }
  }

  return result;
}
