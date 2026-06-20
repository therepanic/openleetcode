class Solution {
  bool canPartition(List<int> nums) {
    int totalSum = nums.fold(0, (a, b) => a + b);
    if (totalSum % 2 != 0) return false;
    int targetSum = totalSum ~/ 2;
    List<bool> dp = List.filled(targetSum + 1, false);
    dp[0] = true;
    for (int num in nums) {
      for (int currSum = targetSum; currSum >= num; currSum--) {
        dp[currSum] = dp[currSum] || dp[currSum - num];
      }
    }
    return dp[targetSum];
  }
}
