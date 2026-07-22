class Solution {
  String minRemoveToMakeValid(String s) {
    List<String> t = [];
    int p = 0;
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == '(') p++;
      else if (c == ')') p--;
      if (p >= 0) {
        t.add(c);
      } else {
        p = 0;
      }
    }
    p = 0;
    List<String> result = [];
    for (int i = t.length - 1; i >= 0; i--) {
      String c = t[i];
      if (c == '(') p++;
      else if (c == ')') p--;
      if (p <= 0) {
        result.add(c);
      } else {
        p = 0;
      }
    }
    return result.reversed.join();
  }
}
