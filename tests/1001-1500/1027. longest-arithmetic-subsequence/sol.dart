class Solution {
  int longestArithSeqLength(List<int> nums) {
    final n = nums.length;
    if (n <= 2) {
      return n;
    }
    final dp = List.generate(n, (_) => <int, int>{});
    var ans = 2;
    for (var i = 0; i < n; i++) {
      for (var j = 0; j < i; j++) {
        final d = nums[i] - nums[j];
        final prev = dp[j][d] ?? 1;
        final current = prev + 1;
        if ((dp[i][d] ?? 0) < current) {
          dp[i][d] = current;
        }
        if (dp[i][d]! > ans) {
          ans = dp[i][d]!;
        }
      }
    }
    return ans;
  }
}
