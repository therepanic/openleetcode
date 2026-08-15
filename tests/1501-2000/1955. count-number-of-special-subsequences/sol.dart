class Solution {
  int countSpecialSubsequences(List<int> nums) {
    const int MOD = 1000000007;
    int dp0 = 0, dp1 = 0, dp2 = 0;
    for (int x in nums) {
      if (x == 0) {
        dp0 = (2 * dp0 + 1) % MOD;
      } else if (x == 1) {
        dp1 = (2 * dp1 + dp0) % MOD;
      } else {
        dp2 = (2 * dp2 + dp1) % MOD;
      }
    }
    return dp2;
  }
}
