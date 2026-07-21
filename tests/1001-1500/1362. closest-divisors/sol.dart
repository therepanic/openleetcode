import 'dart:math' as math;

class Solution {
  List<int> closestDivisors(int num) {
    int start = math.sqrt(num + 2).toInt();
    for (int d = start; d >= 1; d--) {
      if ((num + 1) % d == 0) {
        return [d, (num + 1) ~/ d];
      }
      if ((num + 2) % d == 0) {
        return [d, (num + 2) ~/ d];
      }
    }
    return [];
  }
}
