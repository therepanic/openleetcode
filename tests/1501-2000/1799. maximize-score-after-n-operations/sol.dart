class Solution {
  int maxScore(List<int> nums) {
    int n = nums.length;
    List<List<int>> dp = List.generate(1 << n, (_) => List.filled(n ~/ 2 + 1, -1));

    int gcd(int a, int b) => b == 0 ? a : gcd(b, a % b);

    int dfs(int mask, int op) {
      if (mask == (1 << n) - 1) return 0;
      if (dp[mask][op] != -1) return dp[mask][op];
      int ans = 0;
      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) == 0) {
          for (int j = 0; j < n; j++) {
            if (j != i && (mask & (1 << j)) == 0) {
              int nmask = mask | (1 << i) | (1 << j);
              int val = dfs(nmask, op + 1) + gcd(nums[i], nums[j]) * op;
              if (val > ans) ans = val;
            }
          }
        }
      }
      dp[mask][op] = ans;
      return ans;
    }

    return dfs(0, 1);
  }
}
