class Solution {
  int longestValidParentheses(String s) {
    final st = <int>[-1];
    var ans = 0;
    for (var i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        st.add(i);
      } else {
        st.removeLast();
        if (st.isEmpty) {
          st.add(i);
        } else {
          ans = ans > i - st.last ? ans : i - st.last;
        }
      }
    }
    return ans;
  }
}
