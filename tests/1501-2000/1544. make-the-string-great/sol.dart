class Solution {
  String makeGood(String s) {
    List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      String ch = s[i];
      if (stack.isNotEmpty && ch.toLowerCase() == stack.last.toLowerCase() && ch != stack.last) {
        stack.removeLast();
      } else {
        stack.add(ch);
      }
    }
    return stack.join();
  }
}
