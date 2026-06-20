class Solution {
  int maxPoints(List<List<int>> points) {
    if (points.length <= 2) return points.length;
    var best = 0;
    for (var i = 0; i < points.length; i++) {
      final count = <String, int>{};
      var local = 0;
      var duplicates = 1;
      final x1 = points[i][0];
      final y1 = points[i][1];
      for (var j = i + 1; j < points.length; j++) {
        var dx = points[j][0] - x1;
        var dy = points[j][1] - y1;
        if (dx == 0 && dy == 0) {
          duplicates++;
          continue;
        }
        final g = _gcd(dx, dy);
        dx ~/= g;
        dy ~/= g;
        if (dx < 0) {
          dx = -dx;
          dy = -dy;
        } else if (dx == 0) {
          dy = 1;
        } else if (dy == 0) {
          dx = 1;
        }
        final key = '$dx/$dy';
        final next = (count[key] ?? 0) + 1;
        count[key] = next;
        if (next > local) local = next;
      }
      if (local + duplicates > best) best = local + duplicates;
    }
    return best;
  }

  int _gcd(int a, int b) {
    a = a.abs();
    b = b.abs();
    while (b != 0) {
      final t = a % b;
      a = b;
      b = t;
    }
    return a;
  }
}
