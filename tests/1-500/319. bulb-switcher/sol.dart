import 'dart:math' as math;

class Solution {
  int bulbSwitch(int n) {
    return math.sqrt(n.toDouble()).toInt();
  }
}
