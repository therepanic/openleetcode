import 'dart:math';

class Solution {
  List<List<int>> kClosest(List<List<int>> points, int k) {
    points.sort((a, b) {
      final da = a[0] * a[0] + a[1] * a[1];
      final db = b[0] * b[0] + b[1] * b[1];
      return da.compareTo(db);
    });
    return points.take(k).toList();
  }
}
