function findTargetSumWays(nums: number[], target: number): number {
  const total = nums.reduce((a, b) => a + b, 0);
  if (Math.abs(target) > total || (target + total) % 2 !== 0) {
    return 0;
  }
  const sum = (target + total) / 2;
  const dp = new Array(sum + 1).fill(0);
  dp[0] = 1;

  for (const num of nums) {
    for (let j = sum; j >= num; j--) {
      dp[j] += dp[j - num];
    }
  }

  return dp[sum];
}
