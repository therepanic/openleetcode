class Solution {
  int secondHighest(String s) {
    final digits = s.split('').where((c) => int.tryParse(c) != null).map(int.parse).toSet();
    if (digits.length > 1) {
      final max = digits.reduce((a, b) => a > b ? a : b);
      digits.remove(max);
      return digits.reduce((a, b) => a > b ? a : b);
    }
    return -1;
  }
}
