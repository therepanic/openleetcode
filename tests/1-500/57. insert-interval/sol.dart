class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    final res = <List<int>>[];
    var i = 0;

    while (i < intervals.length && intervals[i][1] < newInterval[0]) {
      res.add([intervals[i][0], intervals[i][1]]);
      i++;
    }

    var start = newInterval[0];
    var end = newInterval[1];
    while (i < intervals.length && intervals[i][0] <= end) {
      if (intervals[i][0] < start) {
        start = intervals[i][0];
      }
      if (intervals[i][1] > end) {
        end = intervals[i][1];
      }
      i++;
    }
    res.add([start, end]);

    while (i < intervals.length) {
      res.add([intervals[i][0], intervals[i][1]]);
      i++;
    }

    return res;
  }
}
