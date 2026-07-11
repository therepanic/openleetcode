class Solution {
  int maxSumAfterPartitioning(List<int> arr, int k) {
    int n = arr.length;
    List<int> dp = List.filled(n + 1, 0);
    for (int i = 1; i <= n; i++) {
      int curr = 0;
      for (int j = 1; j <= k; j++) {
        if (i < j) break;
        if (arr[i - j] > curr) curr = arr[i - j];
        if (dp[i - j] + curr * j > dp[i]) {
          dp[i] = dp[i - j] + curr * j;
        }
      }
    }
    return dp[n];
  }
}
