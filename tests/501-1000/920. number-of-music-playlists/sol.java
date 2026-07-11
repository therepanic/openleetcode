class Solution {
    public int numMusicPlaylists(int n, int goal, int k) {
        final int MOD = 1000000007;
        int[][] dp = new int[2][n + 1];
        dp[0][0] = 1;

        for (int i = 1; i <= goal; i++) {
            dp[i % 2][0] = 0;
            for (int j = 1; j <= Math.min(i, n); j++) {
                dp[i % 2][j] = (int)((long)dp[(i - 1) % 2][j - 1] * (n - (j - 1)) % MOD);
                if (j > k) {
                    dp[i % 2][j] = (int)((dp[i % 2][j] + (long)dp[(i - 1) % 2][j] * (j - k)) % MOD);
                }
            }
        }

        return dp[goal % 2][n];
    }
}
