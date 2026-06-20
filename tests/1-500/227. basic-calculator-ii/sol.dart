class Solution {
  int calculate(String s) {
    List<int> stack = [];
    int n = 0;
    String op = '+';
    s += '+';
    
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == ' ') continue;
      
      if (c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57) {
        n = n * 10 + int.parse(c);
        continue;
      }
      
      if (op == '+') {
        stack.add(n);
      } else if (op == '-') {
        stack.add(-n);
      } else if (op == '*') {
        stack.add(stack.removeLast() * n);
      } else if (op == '/') {
        stack.add(stack.removeLast() ~/ n);
      }
      
      op = c;
      n = 0;
    }
    
    return stack.fold(0, (a, b) => a + b);
  }
}
