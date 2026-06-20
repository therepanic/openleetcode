class Solution {
  int minCut(String s) {
    final n = s.length;
    final isPal = List.generate(n, (_) => List.filled(n, false));
    for (var end = 0; end < n; end++) {
      for (var start = 0; start <= end; start++) {
        if (s[start] == s[end] && (end - start <= 2 || isPal[start + 1][end - 1])) isPal[start][end] = true;
      }
    }
    final dp = List.filled(n, 0);
    for (var i = 0; i < n; i++) {
      if (isPal[0][i]) dp[i] = 0;
      else {
        dp[i] = i;
        for (var j = 0; j < i; j++) if (isPal[j + 1][i] && dp[j] + 1 < dp[i]) dp[i] = dp[j] + 1;
      }
    }
    return dp[n - 1];
  }
}
