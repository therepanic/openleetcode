class Solution {
  String lastSubstring(String s) {
    int i = 0, j = 1, k = 0;
    int n = s.length;
    while (j + k < n) {
      if (s[i + k] == s[j + k]) {
        k++;
        continue;
      } else if (s[i + k].codeUnitAt(0) > s[j + k].codeUnitAt(0)) {
        j = j + k + 1;
      } else {
        i = (i + k + 1 > j ? i + k + 1 : j);
        j = i + 1;
      }
      k = 0;
    }
    return s.substring(i);
  }
}
