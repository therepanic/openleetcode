class Solution {
  int numberOfSubstrings(String s) {
    int res = 0;
    List<int> p = [50000, -1, -1, -1];
    for (int i = 0; i < s.length; i++) {
      p[s.codeUnitAt(i) & 31] = i;
      int min = p[1];
      if (p[2] < min) min = p[2];
      if (p[3] < min) min = p[3];
      res += min + 1;
    }
    return res;
  }
}
