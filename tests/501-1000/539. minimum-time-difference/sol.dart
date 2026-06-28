class Solution {
  int findMinDifference(List<String> timePoints) {
    List<int> times = timePoints.map((t) {
      var parts = t.split(':');
      int h = int.parse(parts[0]);
      int m = int.parse(parts[1]);
      return h * 60 + m;
    }).toList()..sort();
    int minDiff = 0x7fffffffffffffff;
    for (int i = 1; i < times.length; i++) {
      minDiff = min(minDiff, times[i] - times[i - 1]);
    }
    minDiff = min(minDiff, 1440 + times[0] - times[times.length - 1]);
    return minDiff;
  }
}
