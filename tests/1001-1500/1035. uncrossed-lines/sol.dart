class Solution {
  int maxUncrossedLines(List<int> nums1, List<int> nums2) {
    int m = nums1.length;
    int n = nums2.length;
    List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));
    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (nums1[i - 1] == nums2[j - 1]) {
          dp[i][j] = 1 + dp[i - 1][j - 1];
        } else {
          dp[i][j] = dp[i - 1][j] > dp[i][j - 1] ? dp[i - 1][j] : dp[i][j - 1];
        }
      }
    }
    return dp[m][n];
  }
}
