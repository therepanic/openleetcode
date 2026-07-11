class Solution {
  String decodeAtIndex(String s, int k) {
    int size = 0;
    for (var ch in s.split('')) {
      if (ch.codeUnitAt(0) >= 48 && ch.codeUnitAt(0) <= 57) {
        size *= int.parse(ch);
      } else {
        size++;
      }
    }

    int kk = k;
    for (int i = s.length - 1; i >= 0; i--) {
      var ch = s[i];
      kk %= size;
      if (kk == 0 && (ch.codeUnitAt(0) >= 65 && ch.codeUnitAt(0) <= 90 || ch.codeUnitAt(0) >= 97 && ch.codeUnitAt(0) <= 122)) {
        return ch;
      }
      if (ch.codeUnitAt(0) >= 48 && ch.codeUnitAt(0) <= 57) {
        size ~/= int.parse(ch);
      } else {
        size--;
      }
    }
    return "";
  }
}
