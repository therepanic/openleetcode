class Solution {
  String baseNeg2(int n) {
    if (n == 0) {
      return '0';
    }
    final res = <String>[];
    while (n != 0) {
      final digit = n & 1;
      res.add('$digit');
      n = (n - digit) ~/ -2;
    }
    return res.reversed.join();
  }
}
