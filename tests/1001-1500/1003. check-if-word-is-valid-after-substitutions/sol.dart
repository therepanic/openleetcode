class Solution {
  bool isValid(String s) {
    if (s == "abc") {
      return true;
    }
    if (s[0] != "a" || s[s.length - 1] != "c") {
      return false;
    }
    List<String> l = s.split("");
    for (int j = 0; j < l.length; j++) {
      int i = 0;
      while (i <= l.length - 3) {
        if (l.length == 3 && l[0] == "a" && l[1] == "b" && l[2] == "c") {
          return true;
        }
        if (i + 2 <= l.length - 1) {
          if (l[i] == "a" && l[i+1] == "b" && l[i+2] == "c") {
            l.removeAt(i);
            l.removeAt(i);
            l.removeAt(i);
            i = -1;
          }
        }
        i++;
      }
    }
    if (l.length == 0) {
      return true;
    }
    return false;
  }
}
