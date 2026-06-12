class Solution {
  int evalRPN(List<String> tokens) {
    final stack = <int>[];
    for (final token in tokens) {
      if (token == '+' || token == '-' || token == '*' || token == '/') {
        final b = stack.removeLast();
        final a = stack.removeLast();
        switch (token) {
          case '+':
            stack.add(a + b);
            break;
          case '-':
            stack.add(a - b);
            break;
          case '*':
            stack.add(a * b);
            break;
          default:
            stack.add(a ~/ b);
            break;
        }
      } else {
        stack.add(int.parse(token));
      }
    }
    return stack.last;
  }
}
