class Solution {
  int maxPower(String s) {
    int maxcnt = 0;
    int cnt = 0;
    for (int i = 1; i < s.length; i++) {
      if (s[i] == s[i - 1]) {
        cnt++;
      } else {
        cnt = 0;
      }
      if (cnt > maxcnt) {
        maxcnt = cnt;
      }
    }
    return maxcnt + 1;
  }
}
