class Solution {
  int calculate(String s) {
    List<int> stack = [];
    int res = 0;
    int curr = 0;
    int sign = 1;

    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57) {
        curr = curr * 10 + int.parse(c);
      } else if (c == '+') {
        res += sign * curr;
        sign = 1;
        curr = 0;
      } else if (c == '-') {
        res += sign * curr;
        sign = -1;
        curr = 0;
      } else if (c == '(') {
        stack.add(res);
        stack.add(sign);
        res = 0;
        sign = 1;
      } else if (c == ')') {
        res += sign * curr;
        curr = 0;
        res *= stack.removeLast();
        res += stack.removeLast();
      }
    }

    res += sign * curr;
    return res;
  }
}
