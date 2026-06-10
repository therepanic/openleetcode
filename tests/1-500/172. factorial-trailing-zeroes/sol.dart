class Solution {
  int trailingZeroes(int n) {
    int count = 0;
    int divisor = 5;
    while (divisor <= n) {
      count += n ~/ divisor;
      divisor *= 5;
    }
    return count;
  }
}
