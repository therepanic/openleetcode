class Solution {
  List<int> longestObstacleCourseAtEachPosition(List<int> obstacles) {
    final tails = <int>[];
    final res = List<int>.filled(obstacles.length, 0);
    for (int i = 0; i < obstacles.length; i++) {
      final x = obstacles[i];
      final idx = upperBound(tails, x);
      res[i] = idx + 1;
      if (idx == tails.length) {
        tails.add(x);
      } else {
        tails[idx] = x;
      }
    }
    return res;
  }
  
  int upperBound(List<int> list, int target) {
    int lo = 0, hi = list.length;
    while (lo < hi) {
      final mid = lo + ((hi - lo) >> 1);
      if (list[mid] <= target) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }
}
