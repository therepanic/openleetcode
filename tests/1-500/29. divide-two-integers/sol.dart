class Solution {
  int divide(int dividend, int divisor) {
    if (dividend == -1 << 31 && divisor == -1) {
      return (1 << 31) - 1;
    }
    final ans = dividend ~/ divisor;
    if (ans < -(1 << 31)) return -(1 << 31);
    if (ans > (1 << 31) - 1) return (1 << 31) - 1;
    return ans;
  }
}
