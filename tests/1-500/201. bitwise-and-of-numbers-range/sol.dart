class Solution {
  int rangeBitwiseAnd(int left, int right) {
    var shift = 0;
    while (left < right) {
      left >>= 1;
      right >>= 1;
      shift++;
    }
    return left << shift;
  }
}
