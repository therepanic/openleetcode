import 'dart:math';

class Solution {
  int arrangeCoins(int n) {
    return ((sqrt(8.0 * n + 1) - 1) / 2).floor();
  }
}
