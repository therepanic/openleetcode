
class Solution {
  int numDistinct(String s, String t) {
    final dp = List<int>.filled(t.length + 1, 0);
    dp[0] = 1;
    for (var i = 0; i < s.length; i++) {
      for (var j = t.length - 1; j >= 0; j--) {
        if (s[i] == t[j]) dp[j + 1] += dp[j];
      }
    }
    return dp[t.length];
  }
}
