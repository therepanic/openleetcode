class Solution {
  int minInsertions(String s) {
    List<String> stack = [];
    int count = 0;
    int i = 0;
    
    while (i < s.length) {
      if (s[i] == '(') {
        stack.add('(');
      } else {
        if (stack.isEmpty) {
          if (i != s.length - 1 && s[i + 1] == ')') {
            count += 1;
            i++;
          } else {
            count += 2;
          }
        } else {
          if (i != s.length - 1 && s[i + 1] == ')') {
            stack.removeLast();
            i++;
          } else {
            count += 1;
            stack.removeLast();
          }
        }
      }
      i++;
    }
    
    return count + stack.length * 2;
  }
}
