class Solution {
  List<int> countBits(int n) {
    List<int> dp = List.filled(n + 1, 0);
    int sub = 1;
    for (int i = 1; i <= n; i++) {
      if (sub * 2 == i) {
        sub = i;
      }
      dp[i] = dp[i - sub] + 1;
    }
    return dp;
  }
}
