public class Solution {
    public int MinInsertions(string s) {
        int n = s.Length;
        char[] arr = s.ToCharArray();
        Array.Reverse(arr);
        string s2 = new string(arr);
        int[,] dp = new int[n + 1, n + 1];
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                if (s[i - 1] == s2[j - 1]) {
                    dp[i, j] = 1 + dp[i - 1, j - 1];
                } else {
                    dp[i, j] = Math.Max(dp[i - 1, j], dp[i, j - 1]);
                }
            }
        }
        return n - dp[n, n];
    }
}
