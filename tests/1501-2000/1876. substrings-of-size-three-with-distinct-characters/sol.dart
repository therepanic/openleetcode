class Solution {
  int countGoodSubstrings(String s) {
    int n = s.length;
    int count = 0;
    for (int i = 0; i <= n-3; i++) {
      if (s[i] != s[i+1] && s[i+1] != s[i+2] && s[i] != s[i+2]) {
        count++;
      }
    }
    return count;
  }
}
