function maxSubarraySumCircular(nums: number[]): number {
  let maxSum = nums[0];
  let minSum = nums[0];
  let currMaxSum = nums[0];
  let currMinSum = nums[0];
  let totalSum = nums[0];

  for (let i = 1; i < nums.length; i++) {
    currMaxSum = Math.max(currMaxSum + nums[i], nums[i]);
    maxSum = Math.max(maxSum, currMaxSum);

    currMinSum = Math.min(currMinSum + nums[i], nums[i]);
    minSum = Math.min(minSum, currMinSum);

    totalSum += nums[i];
  }

  const circularSum = totalSum - minSum;

  if (circularSum === 0) {
    return maxSum;
  }

  return Math.max(maxSum, circularSum);
}
