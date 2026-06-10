class Solution {
  String fractionToDecimal(int numerator, int denominator) {
    if (numerator == 0) return "0";
    final buffer = StringBuffer();
    if ((numerator < 0) ^ (denominator < 0)) {
      buffer.write('-');
    }
    int num = numerator.abs();
    int den = denominator.abs();
    buffer.write(num ~/ den);
    int rem = num % den;
    if (rem == 0) return buffer.toString();
    buffer.write('.');
    final seen = <int, int>{};
    while (rem != 0) {
      final previous = seen[rem];
      if (previous != null) {
        final current = buffer.toString();
        return current.substring(0, previous) +
            '(' +
            current.substring(previous) +
            ')';
      }
      seen[rem] = buffer.length;
      rem *= 10;
      buffer.write(rem ~/ den);
      rem %= den;
    }
    return buffer.toString();
  }
}
