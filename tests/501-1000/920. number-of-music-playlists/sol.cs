public class Solution {
    public int NumMusicPlaylists(int n, int goal, int k) {
        const int MOD = 1000000007;
        long[][] dp = new long[2][];
        dp[0] = new long[n + 1];
        dp[1] = new long[n + 1];
        dp[0][0] = 1;

        for (int i = 1; i <= goal; i++) {
            dp[i % 2][0] = 0;
            int limit = Math.Min(i, n);
            for (int j = 1; j <= limit; j++) {
                dp[i % 2][j] = dp[(i - 1) % 2][j - 1] * (n - (j - 1)) % MOD;
                if (j > k) {
                    dp[i % 2][j] = (dp[i % 2][j] + dp[(i - 1) % 2][j] * (j - k)) % MOD;
                }
            }
        }

        return (int)dp[goal % 2][n];
    }
}
