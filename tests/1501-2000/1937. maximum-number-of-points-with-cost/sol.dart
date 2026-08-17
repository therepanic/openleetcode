class Solution {
  int maxPoints(List<List<int>> points) {
    int m = points.length;
    int n = points[0].length;
    
    List<int> dp = List<int>.from(points[0]);
    
    for (int r = 1; r < m; r++) {
      List<int> left = List<int>.filled(n, 0);
      List<int> right = List<int>.filled(n, 0);
      
      left[0] = dp[0];
      for (int c = 1; c < n; c++) {
        left[c] = max(left[c-1], dp[c] + c);
      }
      
      right[n-1] = dp[n-1] - (n-1);
      for (int c = n-2; c >= 0; c--) {
        right[c] = max(right[c+1], dp[c] - c);
      }
      
      List<int> newDp = List<int>.filled(n, 0);
      for (int c = 0; c < n; c++) {
        int best = max(left[c] - c, right[c] + c);
        newDp[c] = points[r][c] + best;
      }
      dp = newDp;
    }
    
    int maxVal = dp[0];
    for (int v in dp) {
      if (v > maxVal) maxVal = v;
    }
    return maxVal;
  }
}
