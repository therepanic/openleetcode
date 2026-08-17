class Solution {
  int minSideJumps(List<int> obstacles) {
    final INF = 1 << 30;
    List<int> dp = [1, 0, 1];
    for (int i = 1; i < obstacles.length; i++) {
      int obs = obstacles[i];
      for (int j = 0; j < 3; j++) {
        if (obs == j + 1) dp[j] = INF;
      }
      for (int j = 0; j < 3; j++) {
        if (obs != j + 1) {
          int minVal = (dp[(j + 1) % 3] < dp[(j + 2) % 3]) ? dp[(j + 1) % 3] : dp[(j + 2) % 3];
          if (dp[j] > minVal + 1) dp[j] = minVal + 1;
        }
      }
    }
    return dp.reduce((a, b) => a < b ? a : b);
  }
}
