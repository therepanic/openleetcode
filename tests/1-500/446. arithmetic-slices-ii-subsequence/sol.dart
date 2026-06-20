class Solution {
  int numberOfArithmeticSlices(List<int> nums) {
    int n = nums.length;
    int totalCount = 0;
    List<Map<int, int>> dp = List.generate(n, (_) => {});

    for (int i = 1; i < n; i++) {
      for (int j = 0; j < i; j++) {
        int diff = nums[i] - nums[j];
        dp[i][diff] = (dp[i][diff] ?? 0) + 1;
        if (dp[j].containsKey(diff)) {
          int cnt = dp[j][diff]!;
          dp[i][diff] = dp[i][diff]! + cnt;
          totalCount += cnt;
        }
      }
    }

    return totalCount;
  }
}
