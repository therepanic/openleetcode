class Solution {
  List<List<int>> reconstructQueue(List<List<int>> people) {
    people.sort((a, b) => a[0] != b[0] ? b[0] - a[0] : a[1] - b[1]);
    List<List<int>> q = [];
    for (var p in people) {
      q.insert(p[1], p);
    }
    return q;
  }
}
