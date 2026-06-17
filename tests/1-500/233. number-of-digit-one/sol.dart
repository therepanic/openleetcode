class Solution {
  int countDigitOne(int n) {
    int count = 0;
    int factor = 1;
    while (factor <= n) {
      int lower = n % factor;
      int cur = (n ~/ factor) % 10;
      int higher = n ~/ (factor * 10);
      if (cur == 0) {
        count += higher * factor;
      } else if (cur == 1) {
        count += higher * factor + lower + 1;
      } else {
        count += (higher + 1) * factor;
      }
      factor *= 10;
    }
    return count;
  }
}
