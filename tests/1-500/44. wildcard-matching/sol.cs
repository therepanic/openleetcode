public class Solution {
    public bool IsMatch(string s, string p) {
        int m = s.Length;
        int n = p.Length;
        var dp = new bool[m + 1, n + 1];
        dp[0, 0] = true;

        for (int j = 1; j <= n; j++) {
            if (p[j - 1] == '*') {
                dp[0, j] = dp[0, j - 1];
            }
        }

        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                if (p[j - 1] == '?' || p[j - 1] == s[i - 1]) {
                    dp[i, j] = dp[i - 1, j - 1];
                } else if (p[j - 1] == '*') {
                    dp[i, j] = dp[i, j - 1] || dp[i - 1, j];
                }
            }
        }

        return dp[m, n];
    }
}
