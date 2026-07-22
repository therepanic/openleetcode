class Solution {
  double getMinDistSum(List<List<int>> positions) {
    double distSum(double x, double y) {
      double sum = 0.0;
      for (var p in positions) {
        sum += sqrt((x - p[0]) * (x - p[0]) + (y - p[1]) * (y - p[1]));
      }
      return sum;
    }
    
    double x = 0.0, y = 0.0;
    for (var p in positions) {
      x += p[0];
      y += p[1];
    }
    x /= positions.length;
    y /= positions.length;
    
    double ans = distSum(x, y);
    double chg = 100.0;
    List<List<int>> dirs = [[-1, 0], [0, -1], [0, 1], [1, 0]];
    
    while (chg > 1e-6) {
      bool zoom = true;
      for (var d in dirs) {
        double xx = x + chg * d[0];
        double yy = y + chg * d[1];
        double dd = distSum(xx, yy);
        if (dd < ans) {
          ans = dd;
          x = xx;
          y = yy;
          zoom = false;
          break;
        }
      }
      if (zoom) chg /= 2;
    }
    return ans;
  }
}
