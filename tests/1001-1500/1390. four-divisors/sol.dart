import 'dart:math' as math;

class Solution {
  int sumFourDivisors(List<int> nums) {
    if (nums.isEmpty) return 0;
    int maxNum = nums.reduce((a, b) => a > b ? a : b);
    if (maxNum < 2) return 0;

    List<bool> sieve = List.filled(maxNum + 1, true);
    if (maxNum >= 0) sieve[0] = false;
    if (maxNum >= 1) sieve[1] = false;

    for (int p = 2; p * p <= maxNum; p++) {
      if (sieve[p]) {
        for (int multiple = p * p; multiple <= maxNum; multiple += p) {
          sieve[multiple] = false;
        }
      }
    }

    int total = 0;
    for (int x in nums) {
      // p^3 case
      int p = math.pow(x.toDouble(), 1.0 / 3).round();
      if (p >= 0 && p <= maxNum && p * p * p == x && sieve[p]) {
        total += 1 + p + p * p + x;
        continue;
      }

      // p * q case
      for (int i = 2; i * i <= x; i++) {
        if (x % i == 0) {
          int j = x ~/ i;
          if (i != j && i <= maxNum && j <= maxNum && sieve[i] && sieve[j]) {
            total += 1 + i + j + x;
          }
          break;
        }
      }
    }
    return total;
  }
}
