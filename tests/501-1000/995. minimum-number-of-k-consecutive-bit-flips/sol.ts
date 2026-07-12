function minKBitFlips(nums: number[], k: number): number {
  const n = nums.length;
  let ans = 0;
  let flips = 0;
  const flipped = new Array(n + 1).fill(0);

  for (let i = 0; i <= n - k; i++) {
    flips += flipped[i];
    if (
      (nums[i] === 0 && flips % 2 === 0) ||
      (nums[i] === 1 && flips % 2 !== 0)
    ) {
      flips++;
      ans++;
      flipped[i + k]--;
    }
  }

  for (let i = n - k + 1; i < n; i++) {
    flips += flipped[i];
    if (
      (nums[i] === 0 && flips % 2 === 0) ||
      (nums[i] === 1 && flips % 2 !== 0)
    ) {
      return -1;
    }
  }

  return ans;
}
