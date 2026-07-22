import 'dart:math';

class Solution {
  int numPoints(List<List<int>> darts, int r) {
    int ans = 1;
    double radius = r.toDouble();
    double radiusSq = radius * radius;
    for (int i = 0; i < darts.length; i++) {
      double x1 = darts[i][0].toDouble(), y1 = darts[i][1].toDouble();
      for (int j = i + 1; j < darts.length; j++) {
        double x2 = darts[j][0].toDouble(), y2 = darts[j][1].toDouble();
        double dx = x2 - x1, dy = y2 - y1;
        double distanceSq = dx * dx + dy * dy;
        if (distanceSq > 4.0 * radiusSq) continue;
        double distance = sqrt(distanceSq);
        double midpointX = (x1 + x2) / 2.0;
        double midpointY = (y1 + y2) / 2.0;
        double offset = sqrt(max(0.0, radiusSq - distanceSq / 4.0));
        double normalX = -dy / distance;
        double normalY = dx / distance;
        for (double sign in [-1.0, 1.0]) {
          double centerX = midpointX + sign * offset * normalX;
          double centerY = midpointY + sign * offset * normalY;
          int count = 0;
          for (var dart in darts) {
            double ex = dart[0] - centerX;
            double ey = dart[1] - centerY;
            if (ex * ex + ey * ey <= radiusSq + 1e-9) count++;
          }
          ans = max(ans, count);
        }
      }
    }
    return ans;
  }
}
