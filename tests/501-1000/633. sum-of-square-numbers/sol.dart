import 'dart:math';

class Solution {
  bool judgeSquareSum(int c) {
    int left = 0;
    int right = sqrt(c.toDouble()).toInt();
    while (left <= right) {
      int currentSum = left * left + right * right;
      if (currentSum == c) {
        return true;
      } else if (currentSum < c) {
        left++;
      } else {
        right--;
      }
    }
    return false;
  }
}
