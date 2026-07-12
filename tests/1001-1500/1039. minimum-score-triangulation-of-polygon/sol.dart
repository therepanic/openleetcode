class Solution {
  int minScoreTriangulation(List<int> values) {
    int n = values.length;
    List<List<int>> dp = List.generate(n, (_) => List.filled(n, 0));
    for (int i = n - 1; i >= 0; i--) {
      for (int j = i + 1; j < n; j++) {
        int minVal = 1 << 63 - 1;
        for (int k = i + 1; k < j; k++) {
          int val = dp[i][k] + values[i] * values[k] * values[j] + dp[k][j];
          if (val < minVal) {
            minVal = val;
          }
        }
        if (minVal != 1 << 63 - 1) {
          dp[i][j] = minVal;
        }
      }
    }
    return dp[0][n - 1];
  }
}
