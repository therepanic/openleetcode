class Solution {
  int maxResult(List<int> nums, int k) {
    int n = nums.length;
    List<int> dp = List.filled(n, 0);
    dp[0] = nums[0];
    List<int> dq = [0];
    int head = 0;
    for (int i = 1; i < n; i++) {
      if (dq[head] < i - k) {
        head++;
      }
      dp[i] = nums[i] + dp[dq[head]];
      while (dq.length > head && dp[dq[dq.length - 1]] <= dp[i]) {
        dq.removeLast();
      }
      dq.add(i);
    }
    return dp[n - 1];
  }
}
