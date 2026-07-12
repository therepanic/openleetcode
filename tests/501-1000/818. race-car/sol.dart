class Solution {
  int racecar(int target) {
    var q = Queue<List<int>>();
    q.add([0, 1, 0]);
    while (q.isNotEmpty) {
      var cur = q.removeFirst();
      int cp = cur[0], cs = cur[1], nm = cur[2];
      if (cp == target) return nm;
      q.add([cp + cs, cs * 2, nm + 1]);
      if ((cp + cs > target && cs > 0) || (cp + cs < target && cs < 0)) {
        if (cs < 0) {
          q.add([cp, 1, nm + 1]);
        } else {
          q.add([cp, -1, nm + 1]);
        }
      }
    }
    return -1;
  }
}
