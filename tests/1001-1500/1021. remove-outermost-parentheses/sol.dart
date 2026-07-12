class Solution {
  String removeOuterParentheses(String s) {
    final res = StringBuffer();
    int balance = 0;
    int start = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        balance++;
      } else {
        balance--;
      }
      if (balance == 0) {
        res.write(s.substring(start + 1, i));
        start = i + 1;
      }
    }
    return res.toString();
  }
}
