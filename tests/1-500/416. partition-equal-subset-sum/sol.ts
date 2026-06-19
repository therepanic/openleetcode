function canPartition(nums: number[]): boolean {
  const totalSum = nums.reduce((a, b) => a + b, 0);
  if (totalSum % 2 !== 0) return false;
  const targetSum = totalSum / 2;
  const dp: boolean[] = new Array(targetSum + 1).fill(false);
  dp[0] = true;
  for (const num of nums) {
    for (let currSum = targetSum; currSum >= num; currSum--) {
      dp[currSum] = dp[currSum] || dp[currSum - num];
    }
  }
  return dp[targetSum];
}
