class Solution {
  int minAddToMakeValid(String s) {
    List<String> l = ['0'];
    for (int i = 0; i < s.length; i++) {
      if (l.last == '(' && s[i] == ')') {
        l.removeLast();
      } else {
        l.add(s[i]);
      }
    }
    return l.length - 1;
  }
}
