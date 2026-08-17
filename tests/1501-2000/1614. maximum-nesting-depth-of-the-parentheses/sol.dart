class Solution {
  int maxDepth(String s) {
    int ctr = 0;
    int ans = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        ctr++;
        if (ctr > ans) ans = ctr;
      } else if (s[i] == ')') {
        ctr--;
      }
    }
    return ans;
  }
}
