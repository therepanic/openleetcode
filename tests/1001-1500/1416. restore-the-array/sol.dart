class Solution {
  int numberOfArrays(String s, int k) {
    int mod = 1000000007;
    int n = s.length;
    List<int> dp = List.filled(n + 1, 0);
    dp[0] = 1;
    int width = k.toString().length;
    for (int i = 0; i < n; i++) {
      if (s[i] == '0' || dp[i] == 0) continue;
      int value = 0;
      for (int j = i; j < n && j < i + width; j++) {
        value = value * 10 + (s.codeUnitAt(j) - 48);
        if (value > k) break;
        dp[j + 1] = (dp[j + 1] + dp[i]) % mod;
      }
    }
    return dp[n];
  }
}
