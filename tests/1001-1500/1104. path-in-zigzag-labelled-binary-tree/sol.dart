class Solution {
  List<int> pathInZigZagTree(int label) {
    List<int> res = [];
    var cur = label;
    while (cur > 0) {
      res.add(cur);
      var start = 1;
      while (start * 2 <= cur) {
        start *= 2;
      }
      final end = start * 2 - 1;
      cur = (start + end - cur) ~/ 2;
    }
    return res.reversed.toList();
  }
}
