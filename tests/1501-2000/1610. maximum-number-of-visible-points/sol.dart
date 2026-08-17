import 'dart:math';

class Solution {
  int visiblePoints(List<List<int>> points, int angle, List<int> location) {
    List<double> angles = [];
    int same = 0;
    int x0 = location[0], y0 = location[1];
    
    for (var p in points) {
      int dx = p[0] - x0;
      int dy = p[1] - y0;
      if (dx == 0 && dy == 0) {
        same++;
        continue;
      }
      double ang = atan2(dy.toDouble(), dx.toDouble()) * 180 / pi;
      angles.add(ang);
    }
    
    if (angles.isEmpty) return same;
    
    angles.sort();
    int n = angles.length;
    List<double> full = List.from(angles);
    for (var a in angles) {
      full.add(a + 360);
    }
    
    int maxVis = 0;
    int j = 0;
    for (int i = 0; i < n; i++) {
      while (j < full.length && full[j] - full[i] <= angle.toDouble()) {
        j++;
      }
      if (j - i > maxVis) maxVis = j - i;
    }
    
    return maxVis + same;
  }
}
