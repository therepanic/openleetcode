class Solution {
  int maxDotProduct(List<int> nums1, List<int> nums2) {
    List<List<int>> memo = List.generate(
      nums1.length + 1,
      (_) => List.filled(nums2.length + 1, -2147483648),
    );

    int dp(int i, int j) {
      if (i == nums1.length || j == nums2.length) {
        return -2147483648;
      }
      if (memo[i][j] != -2147483648) {
        return memo[i][j];
      }

      int take = nums1[i] * nums2[j];
      int res = take;
      int takeAndContinue = dp(i + 1, j + 1);
      if (takeAndContinue != -2147483648) {
        res = max(res, take + takeAndContinue);
      }
      res = max(res, dp(i + 1, j));
      res = max(res, dp(i, j + 1));

      memo[i][j] = res;
      return res;
    }

    return dp(0, 0);
  }

  int max(int a, int b) => a > b ? a : b;
}
