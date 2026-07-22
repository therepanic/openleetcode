class Solution {
  int removeCoveredIntervals(List<List<int>> intervals) {
    intervals.sort((a, b) => a[0] == b[0] ? b[1].compareTo(a[1]) : a[0].compareTo(b[0]));
    int res = 0, r = 0;
    for (final interval in intervals) {
      if (interval[1] > r) {
        res++;
      }
      r = r > interval[1] ? r : interval[1];
    }
    return res;
  }
}
