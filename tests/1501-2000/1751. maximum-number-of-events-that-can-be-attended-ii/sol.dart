class Solution {
  int maxValue(List<List<int>> events, int k) {
    events.sort((a, b) => a[1].compareTo(b[1]));
    int n = events.length;
    List<List<int>> dp = List.generate(n + 1, (_) => List.filled(k + 1, 0));
    
    for (int i = 1; i <= n; i++) {
      int start = events[i - 1][0];
      int value = events[i - 1][2];
      int prev = findLastNonOverlapping(events, i - 1, start);
      for (int j = 1; j <= k; j++) {
        dp[i][j] = dp[i - 1][j] > dp[prev + 1][j - 1] + value
            ? dp[i - 1][j]
            : dp[prev + 1][j - 1] + value;
      }
    }
    return dp[n][k];
  }
  
  int findLastNonOverlapping(List<List<int>> events, int right, int targetStart) {
    int left = 0;
    int res = -1;
    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (events[mid][1] < targetStart) {
        res = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return res;
  }
}
