class Solution {
  int minSpaceWastedKResizing(List<int> nums, int k) {
    int n = nums.length;
    List<int> P = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      P[i+1] = P[i] + nums[i];
    }
    List<int> dp = List.filled(n + 1, 1 << 60);
    int maxV = 0;
    for (int i = 1; i <= n; i++) {
      maxV = maxV > nums[i-1] ? maxV : nums[i-1];
      dp[i] = maxV * i - P[i];
    }
    for (int t = 0; t < k; t++) {
      List<int> newDp = List.filled(n + 1, 1 << 60);
      newDp[0] = 0;
      for (int i = 1; i <= n; i++) {
        int curMax = 0;
        for (int j = i - 1; j >= 0; j--) {
          curMax = curMax > nums[j] ? curMax : nums[j];
          int waste = curMax * (i - j) - (P[i] - P[j]);
          if (dp[j] + waste < newDp[i]) {
            newDp[i] = dp[j] + waste;
          }
        }
      }
      dp = newDp;
    }
    return dp[n];
  }
}
