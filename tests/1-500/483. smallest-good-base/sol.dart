import 'dart:math';

class Solution {
  String smallestGoodBase(String n) {
    final num = BigInt.parse(n);
    final maxM = num.bitLength - 1;

    for (int m = maxM; m >= 1; m--) {
      BigInt left = BigInt.from(2);
      BigInt right = _powUpperBound(n, m);
      while (left <= right) {
        final mid = (left + right) >> 1;
        final cmp = _compare(mid, m, num);
        if (cmp == 0) {
          return mid.toString();
        }
        if (cmp < 0) {
          left = mid + BigInt.one;
        } else {
          right = mid - BigInt.one;
        }
      }
    }
    return (num - BigInt.one).toString();
  }

  BigInt _powUpperBound(String n, int m) {
    final approx = pow(double.parse(n), 1.0 / m).floor() + 1;
    return BigInt.from(approx);
  }

  int _compare(BigInt base, int m, BigInt n) {
    BigInt sum = BigInt.one;
    BigInt cur = BigInt.one;
    for (int i = 0; i < m; i++) {
      cur *= base;
      sum += cur;
      if (sum > n) return 1;
    }
    if (sum == n) return 0;
    return -1;
  }
}
