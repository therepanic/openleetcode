class Solution {
  double largestSumOfAverages(List<int> nums, int k) {
    int n = nums.length;
    List<int> pref = List.filled(n+1, 0);
    for (int i = 0; i < n; i++) {
      pref[i+1] = pref[i] + nums[i];
    }
    List<List<double>> dp = List.generate(n+1, (_) => List.filled(k+1, 0.0));
    for (int i = 1; i <= n; i++) {
      dp[i][1] = pref[i] / i;
    }
    for (int p = 2; p <= k; p++) {
      for (int i = p; i <= n; i++) {
        double best = 0.0;
        for (int j = p-1; j < i; j++) {
          double val = dp[j][p-1] + (pref[i] - pref[j]) / (i - j);
          if (val > best) best = val;
        }
        dp[i][p] = best;
      }
    }
    return dp[n][k];
  }
}
