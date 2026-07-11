class Solution {
  List<List<int>> largeGroupPositions(String s) {
    List<List<int>> intervals = [];
    int left = 0;
    while (left < s.length) {
      int start = left;
      while (left + 1 < s.length && s[left + 1] == s[left]) {
        left++;
      }
      if (left - start >= 2) {
        intervals.add([start, left]);
      }
      left++;
    }
    return intervals;
  }
}
