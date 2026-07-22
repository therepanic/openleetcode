class Solution {
  bool uniqueOccurrences(List<int> arr) {
    var d = <int, int>{};
    for (var i in arr) {
      if (d.containsKey(i)) {
        d[i] = d[i]! + 1;
      } else {
        d[i] = 1;
      }
    }
    var s = <int>{};
    for (var value in d.values) {
      if (s.contains(value)) {
        return false;
      }
      s.add(value);
    }
    return true;
  }
}
