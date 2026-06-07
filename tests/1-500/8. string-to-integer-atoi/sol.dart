class Solution {
  int myAtoi(String s) {
    s = s.trimLeft();
    if (s.isEmpty) {
      return 0;
    }

    var sign = 1;
    var i = 0;
    if (s[0] == '-') {
      sign = -1;
      i++;
    } else if (s[0] == '+') {
      i++;
    }

    var res = 0;
    while (i < s.length) {
      final code = s.codeUnitAt(i);
      if (code < 48 || code > 57) {
        break;
      }
      final digit = code - 48;
      if (sign == 1) {
        if (res > 214748364 || (res == 214748364 && digit > 7)) {
          return 2147483647;
        }
      } else {
        if (res > 214748364 || (res == 214748364 && digit > 8)) {
          return -2147483648;
        }
      }
      res = res * 10 + digit;
      i++;
    }

    return sign == 1 ? res : -res;
  }
}
