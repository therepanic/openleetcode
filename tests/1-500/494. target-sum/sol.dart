class Solution {
  int findTargetSumWays(List<int> nums, int target) {
    int total = nums.fold(0, (sum, num) => sum + num);
    if (target.abs() > total || (target + total) % 2 != 0) {
      return 0;
    }
    int sum = (target + total) ~/ 2;
    List<int> dp = List.filled(sum + 1, 0);
    dp[0] = 1;

    for (int num in nums) {
      for (int j = sum; j >= num; j--) {
        dp[j] += dp[j - num];
      }
    }

    return dp[sum];
  }
}
