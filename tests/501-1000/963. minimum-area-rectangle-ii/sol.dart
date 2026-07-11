class Solution {
  double minAreaFreeRect(List<List<int>> points) {
    double ans = double.infinity;
    var seen = <String, List<List<int>>>{};
    int n = points.length;
    for (int i = 0; i < n; i++) {
      int x0 = points[i][0], y0 = points[i][1];
      for (int j = i + 1; j < n; j++) {
        int x1 = points[j][0], y1 = points[j][1];
        double cx = (x0 + x1) / 2.0;
        double cy = (y0 + y1) / 2.0;
        int d2 = (x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1);
        String key = '$cx,$cy,$d2';
        if (seen.containsKey(key)) {
          for (var prev in seen[key]!) {
            int xx = prev[0], yy = prev[1];
            double area = sqrt(((x0 - xx) * (x0 - xx) + (y0 - yy) * (y0 - yy)) *
                             ((x1 - xx) * (x1 - xx) + (y1 - yy) * (y1 - yy)).toDouble());
            ans = min(ans, area);
          }
        }
        seen.putIfAbsent(key, () => []).add([x0, y0]);
      }
    }
    return ans == double.infinity ? 0.0 : ans;
  }
}
