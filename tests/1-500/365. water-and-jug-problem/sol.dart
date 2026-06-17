import 'dart:collection';

class Solution {
  bool canMeasureWater(int x, int y, int target) {
    if (target > x + y) return false;
    var stack = Queue<List<int>>();
    var visited = <String>{};
    stack.addLast([0, 0]);
    while (stack.isNotEmpty) {
      var state = stack.removeLast();
      int a = state[0], b = state[1];
      if (a + b == target) return true;
      var key = '$a,$b';
      if (visited.contains(key)) continue;
      visited.add(key);
      stack.addLast([x, b]);
      stack.addLast([a, y]);
      stack.addLast([0, b]);
      stack.addLast([a, 0]);
      int w = a < y - b ? a : y - b;
      stack.addLast([a - w, b + w]);
      w = b < x - a ? b : x - a;
      stack.addLast([a + w, b - w]);
    }
    return false;
  }
}
