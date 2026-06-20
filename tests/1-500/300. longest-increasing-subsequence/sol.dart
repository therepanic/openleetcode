class Solution {
  int lengthOfLIS(List<int> nums) {
    int prevIdx = -1;
    List<List<int>> dp = List.generate(2500, (_) => List.filled(2500, -1));
    return helper(0, prevIdx, nums, dp);
  }

  int helper(int i, int prevIdx, List<int> nums, List<List<int>> dp) {
    if (i >= nums.length) {
      return 0;
    }
    if (dp[i][prevIdx + 1] != -1) {
      return dp[i][prevIdx + 1];
    }
    int steal = 0;
    int skip = 0;
    if (prevIdx == -1 || nums[prevIdx] < nums[i]) {
      steal = 1 + helper(i + 1, i, nums, dp);
    }
    skip = helper(i + 1, prevIdx, nums, dp);
    dp[i][prevIdx + 1] = steal > skip ? steal : skip;
    return dp[i][prevIdx + 1];
  }
}
