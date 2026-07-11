class Solution {
  int maxSubarraySumCircular(List<int> nums) {
    int maxSum = nums[0];
    int minSum = nums[0];
    int currMaxSum = nums[0];
    int currMinSum = nums[0];
    int totalSum = nums[0];
    
    for (int i = 1; i < nums.length; i++) {
      currMaxSum = (currMaxSum + nums[i] > nums[i]) ? currMaxSum + nums[i] : nums[i];
      maxSum = (currMaxSum > maxSum) ? currMaxSum : maxSum;
      
      currMinSum = (currMinSum + nums[i] < nums[i]) ? currMinSum + nums[i] : nums[i];
      minSum = (currMinSum < minSum) ? currMinSum : minSum;
      
      totalSum += nums[i];
    }
    
    int circularSum = totalSum - minSum;
    
    if (circularSum == 0) {
      return maxSum;
    }
    
    return (maxSum > circularSum) ? maxSum : circularSum;
  }
}
