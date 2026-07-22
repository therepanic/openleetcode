class Solution {
  int maxSumDivThree(List<int> nums) {
    int n = nums.length;
    int minus = -(1 << 30);
    List<List<int>> dp = [List.filled(3, 0), [0, minus, minus]];
    for (int i = 0; i < n; i++) {
      int x = nums[i];
      int x3 = x % 3;
      for (int mod = 0; mod < 3; mod++) {
        int modPrev = (3 + mod - x3) % 3;
        int take = x + dp[(i + 1) & 1][modPrev];
        int skip = dp[(i + 1) & 1][mod];
        dp[i & 1][mod] = take > skip ? take : skip;
      }
    }
    int ans = dp[(n - 1) & 1][0];
    return ans > 0 ? ans : 0;
  }
}
