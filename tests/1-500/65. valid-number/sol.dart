class Solution {
  bool isNumber(String s) {
    var seenDigit = false;
    var seenDot = false;
    var seenExp = false;
    var seenDigitAfterExp = true;

    for (var i = 0; i < s.length; i++) {
      final c = s[i];
      if (_isDigit(c)) {
        seenDigit = true;
        seenDigitAfterExp = true;
      } else if (c == '.') {
        if (seenDot || seenExp) {
          return false;
        }
        seenDot = true;
      } else if (c == 'e' || c == 'E') {
        if (seenExp || !seenDigit) {
          return false;
        }
        seenExp = true;
        seenDigitAfterExp = false;
      } else if (c == '+' || c == '-') {
        if (i > 0 && s[i - 1] != 'e' && s[i - 1] != 'E') {
          return false;
        }
      } else {
        return false;
      }
    }

    return seenDigit && seenDigitAfterExp;
  }

  bool _isDigit(String c) => c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57;
}
