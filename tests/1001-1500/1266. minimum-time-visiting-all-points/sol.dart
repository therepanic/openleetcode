class Solution {
  int minTimeToVisitAllPoints(List<List<int>> points) {
    int ans = 0;
    for (int i = 1; i < points.length; i++) {
      int dx = (points[i][0] - points[i - 1][0]).abs();
      int dy = (points[i][1] - points[i - 1][1]).abs();
      ans += dx > dy ? dx : dy;
    }
    return ans;
  }
}
