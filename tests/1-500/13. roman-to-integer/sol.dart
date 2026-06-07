class Solution {
  int romanToInt(String s) {
    const roman = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000};
    var res = 0;
    for (var i = 0; i + 1 < s.length; i++) {
      if (roman[s[i]]! < roman[s[i + 1]]!) {
        res -= roman[s[i]]!;
      } else {
        res += roman[s[i]]!;
      }
    }
    return res + roman[s[s.length - 1]]!;
  }
}
