class Solution {
  bool isValid(String s) {
    final stack = <String>[];
    for (final ch in s.split('')) {
      if (ch == '(' || ch == '[' || ch == '{') {
        stack.add(ch);
      } else {
        if (stack.isEmpty) return false;
        final top = stack.removeLast();
        if (ch == ')' && top != '(') return false;
        if (ch == ']' && top != '[') return false;
        if (ch == '}' && top != '{') return false;
      }
    }
    return stack.isEmpty;
  }
}
