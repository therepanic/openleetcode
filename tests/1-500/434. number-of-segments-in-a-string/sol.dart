class Solution {
  int countSegments(String s) {
    int c = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] != ' ' && (i == 0 || s[i - 1] == ' ')) {
        c++;
      }
    }
    return c;
  }
}
