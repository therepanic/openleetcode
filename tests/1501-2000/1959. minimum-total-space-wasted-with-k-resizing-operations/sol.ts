function minSpaceWastedKResizing(nums: number[], k: number): number {
  const n = nums.length;
  const P: number[] = new Array(n + 1).fill(0);
  for (let i = 0; i < n; i++) {
    P[i + 1] = P[i] + nums[i];
  }
  let dp: number[] = new Array(n + 1).fill(Infinity);
  let maxV = 0;
  for (let i = 1; i <= n; i++) {
    maxV = Math.max(maxV, nums[i - 1]);
    dp[i] = maxV * i - P[i];
  }
  for (let t = 0; t < k; t++) {
    const newDp: number[] = new Array(n + 1).fill(Infinity);
    newDp[0] = 0;
    for (let i = 1; i <= n; i++) {
      let curMax = 0;
      for (let j = i - 1; j >= 0; j--) {
        curMax = Math.max(curMax, nums[j]);
        const waste = curMax * (i - j) - (P[i] - P[j]);
        newDp[i] = Math.min(newDp[i], dp[j] + waste);
      }
    }
    dp = newDp;
  }
  return dp[n];
}
