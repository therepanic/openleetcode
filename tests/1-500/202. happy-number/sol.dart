class Solution {
  bool isHappy(int n) {
    final seen = <int>{};
    while (n != 1 && seen.add(n)) {
      n = _nextValue(n);
    }
    return n == 1;
  }

  int _nextValue(int n) {
    var total = 0;
    while (n > 0) {
      final digit = n % 10;
      total += digit * digit;
      n ~/= 10;
    }
    return total;
  }
}
