class Solution {
  String pushDominoes(String dominoes) {
    String s = "L" + dominoes + "R";
    StringBuffer res = StringBuffer();
    int prev = 0;
    for (int curr = 1; curr < s.length; curr++) {
      if (s[curr] == '.') continue;
      int span = curr - prev - 1;
      if (prev > 0) res.write(s[prev]);
      if (s[prev] == s[curr]) {
        res.write(s[prev] * span);
      } else if (s[prev] == 'L' && s[curr] == 'R') {
        res.write('.' * span);
      } else {
        res.write('R' * (span ~/ 2));
        if (span % 2 == 1) res.write('.');
        res.write('L' * (span ~/ 2));
      }
      prev = curr;
    }
    return res.toString();
  }
}
