class Solution {
  int i = 0;

  String reverseParentheses(String s) {
    i = 0;
    return helper(s);
  }

  String helper(String s) {
    String ans = "";
    while (i < s.length) {
      if (s[i] == '(') {
        i++;
        ans += helper(s);
      } else if (s[i] == ')') {
        i++;
        return ans.split('').reversed.join('');
      } else {
        ans += s[i];
        i++;
      }
    }
    return ans;
  }
}
