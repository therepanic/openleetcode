class Solution {
  int monotoneIncreasingDigits(int n) {
    var s = n.toString().codeUnits.toList();
    int mark = s.length;
    for (int i = s.length - 1; i > 0; i--) {
      if (s[i] < s[i - 1]) {
        s[i - 1]--;
        mark = i;
      }
    }
    for (int i = mark; i < s.length; i++) {
      s[i] = '9'.codeUnitAt(0);
    }
    return int.parse(String.fromCharCodes(s));
  }
}
