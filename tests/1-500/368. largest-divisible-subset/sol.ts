function largestDivisibleSubset(nums: number[]): number[] {
  nums.sort((a, b) => a - b);
  const n = nums.length;
  const dp = new Array(n).fill(1);
  const prev = new Array(n).fill(-1);
  let maxi = 0;
  for (let i = 1; i < n; i++) {
    for (let j = 0; j < i; j++) {
      if (nums[i] % nums[j] === 0 && dp[i] < dp[j] + 1) {
        dp[i] = dp[j] + 1;
        prev[i] = j;
      }
    }
    if (dp[i] > dp[maxi]) {
      maxi = i;
    }
  }
  const res: number[] = [];
  for (let i = maxi; i >= 0; i = prev[i]) {
    res.push(nums[i]);
  }
  return res.reverse();
}
