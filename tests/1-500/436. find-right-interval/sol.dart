class Solution {
  List<int> findRightInterval(List<List<int>> intervals) {
    int n = intervals.length;
    List<List<int>> starts = [];
    for (int i = 0; i < n; i++) {
      starts.add([intervals[i][0], i]);
    }
    starts.sort((a, b) => a[0].compareTo(b[0]));
    List<int> res = [];
    for (int i = 0; i < n; i++) {
      int end = intervals[i][1];
      int left = 0, right = n - 1;
      int idx = -1;
      while (left <= right) {
        int mid = (left + right) ~/ 2;
        if (starts[mid][0] >= end) {
          idx = starts[mid][1];
          right = mid - 1;
        } else {
          left = mid + 1;
        }
      }
      res.add(idx);
    }
    return res;
  }
}
