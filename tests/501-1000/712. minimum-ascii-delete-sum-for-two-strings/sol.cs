public class Solution {
    public int MinimumDeleteSum(string s1, string s2) {
        int n = s1.Length, m = s2.Length;
        int[,] dp = new int[n + 1, m + 1];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (s1[i] == s2[j]) {
                    dp[i + 1, j + 1] = dp[i, j] + (int)s1[i];
                } else {
                    dp[i + 1, j + 1] = Math.Max(dp[i, j + 1], dp[i + 1, j]);
                }
            }
        }
        int totalAscii = 0;
        foreach (char c in s1) totalAscii += (int)c;
        foreach (char c in s2) totalAscii += (int)c;
        return totalAscii - 2 * dp[n, m];
    }
}
