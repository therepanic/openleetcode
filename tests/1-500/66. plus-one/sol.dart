class Solution {
  List<int> plusOne(List<int> digits) {
    for (var i = digits.length - 1; i >= 0; i--) {
      if (digits[i] < 9) {
        digits[i]++;
        return digits;
      }
      digits[i] = 0;
    }
    return [1] + digits;
  }
}
