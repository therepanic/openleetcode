class Solution {
  int consecutiveNumbersSum(int n) {
    int maxSequenceLength = (((sqrt(1 + 8 * n) - 1) / 2)).floor();
    int c = 0;
    for (int i = 2; i <= maxSequenceLength; i++) {
      if (i % 2 == 1 && n % i == 0) {
        c++;
      } else if (i % 2 == 0 && n % i == i ~/ 2) {
        c++;
      }
    }
    return c + 1;
  }
}
