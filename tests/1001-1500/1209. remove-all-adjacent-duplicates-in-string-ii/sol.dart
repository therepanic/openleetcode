class Solution {
  String removeDuplicates(String s, int k) {
    List<List<Object>> stack = [];
    for (int i = 0; i < s.length; i++) {
      String char = s[i];
      if (stack.isNotEmpty && stack.last[0] == char) {
        stack.last[1] = (stack.last[1] as int) + 1;
      } else {
        stack.add([char, 1]);
      }
      if (stack.last[1] == k) {
        stack.removeLast();
      }
    }
    StringBuffer sb = StringBuffer();
    for (var pair in stack) {
      String char = pair[0] as String;
      int count = pair[1] as int;
      sb.write(char * count);
    }
    return sb.toString();
  }
}
