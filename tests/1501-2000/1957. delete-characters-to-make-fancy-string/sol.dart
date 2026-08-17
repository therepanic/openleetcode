class Solution {
  String makeFancyString(String s) {
    if (s.isEmpty) return "";
    String result = s[0];
    String last = s[0];
    int count = 1;

    for (int i = 1; i < s.length; i++) {
      if (s[i] != last) {
        last = s[i];
        count = 0;
      }

      count++;
      if (count > 2) continue;

      result += s[i];
    }

    return result;
  }
}
