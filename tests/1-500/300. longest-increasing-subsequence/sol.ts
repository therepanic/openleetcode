function lengthOfLIS(nums: number[]): number {
  const prevIdx = -1;
  const dp: number[][] = Array.from({ length: 2500 }, () =>
    Array(2500).fill(-1),
  );
  return helper(0, prevIdx, nums, dp);
}

function helper(
  i: number,
  prevIdx: number,
  nums: number[],
  dp: number[][],
): number {
  if (i >= nums.length) {
    return 0;
  }
  if (dp[i][prevIdx + 1] !== -1) {
    return dp[i][prevIdx + 1];
  }
  let steal = 0;
  let skip = 0;
  if (prevIdx === -1 || nums[prevIdx] < nums[i]) {
    steal = 1 + helper(i + 1, i, nums, dp);
  }
  skip = helper(i + 1, prevIdx, nums, dp);
  dp[i][prevIdx + 1] = Math.max(steal, skip);
  return Math.max(steal, skip);
}
