class Solution {
  String removeDuplicates(String s) {
    List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (stack.isNotEmpty && stack.last == c) {
        stack.removeLast();
      } else {
        stack.add(c);
      }
    }
    return stack.join('');
  }
}
