public class Solution {
    public int PalindromePartition(string s, int k) {
        int n = s.Length;
        int[,] c = new int[n, n];
        for (int l = 2; l <= n; l++) {
            for (int i = 0; i <= n - l; i++) {
                int j = i + l - 1;
                c[i, j] = (l > 2 ? c[i + 1, j - 1] : 0) + (s[i] != s[j] ? 1 : 0);
            }
        }
        int[,] dp = new int[k + 1, n + 1];
        for (int i = 0; i <= k; i++) {
            for (int j = 0; j <= n; j++) {
                dp[i, j] = int.MaxValue / 2;
            }
        }
        dp[0, 0] = 0;
        for (int i = 1; i <= n; i++) {
            dp[1, i] = c[0, i - 1];
        }
        for (int p = 2; p <= k; p++) {
            for (int i = p; i <= n; i++) {
                int mn = int.MaxValue / 2;
                for (int t = p - 1; t < i; t++) {
                    mn = Math.Min(mn, dp[p - 1, t] + c[t, i - 1]);
                }
                dp[p, i] = mn;
            }
        }
        return dp[k, n];
    }
}
