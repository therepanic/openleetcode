class Solution {
  int countBinarySubstrings(String s) {
    int ans = 0, prev = 0, cur = 1;
    for (int i = 1; i < s.length; i++) {
      if (s[i-1] != s[i]) {
        ans += prev < cur ? prev : cur;
        prev = cur;
        cur = 1;
      } else {
        cur++;
      }
    }
    return ans + (prev < cur ? prev : cur);
  }
}
