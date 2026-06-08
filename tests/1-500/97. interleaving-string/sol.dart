class Solution {
  bool isInterleave(String s1, String s2, String s3) {
    final m = s1.length;
    final n = s2.length;
    if (m + n != s3.length) {
      return false;
    }

    final dp = List<bool>.filled(n + 1, false);
    dp[0] = true;
    for (int j = 1; j <= n; j++) {
      dp[j] = dp[j - 1] && s2[j - 1] == s3[j - 1];
    }

    for (int i = 1; i <= m; i++) {
      dp[0] = dp[0] && s1[i - 1] == s3[i - 1];
      for (int j = 1; j <= n; j++) {
        dp[j] = (dp[j] && s1[i - 1] == s3[i + j - 1]) ||
            (dp[j - 1] && s2[j - 1] == s3[i + j - 1]);
      }
    }

    return dp[n];
  }
}
