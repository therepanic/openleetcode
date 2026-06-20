class Solution {
  int eraseOverlapIntervals(List<List<int>> intervals) {
    if (intervals.isEmpty) return 0;
    intervals.sort((a, b) => a[1].compareTo(b[1]));
    int count = 0;
    int end = intervals[0][1];
    for (int i = 1; i < intervals.length; i++) {
      if (end > intervals[i][0]) {
        count++;
      } else {
        end = intervals[i][1];
      }
    }
    return count;
  }
}
