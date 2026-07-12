class Solution {
    public int mergeStones(int[] stones, int k) {
        int n = stones.length;
        if ((n - 1) % (k - 1) != 0) return -1;
        
        int[] prefix = new int[n + 1];
        for (int i = 1; i <= n; i++) {
            prefix[i] = prefix[i-1] + stones[i-1];
        }
        
        int[][][] dp = new int[n][n][k + 1];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                for (int p = 0; p <= k; p++) {
                    dp[i][j][p] = Integer.MAX_VALUE;
                }
            }
        }
        
        for (int i = 0; i < n; i++) {
            dp[i][i][1] = 0;
        }
        
        for (int len = 2; len <= n; len++) {
            for (int i = 0; i + len - 1 < n; i++) {
                int j = i + len - 1;
                for (int p = 2; p <= k; p++) {
                    for (int m = i; m < j; m += k - 1) {
                        if (dp[i][m][1] != Integer.MAX_VALUE && dp[m+1][j][p-1] != Integer.MAX_VALUE) {
                            dp[i][j][p] = Math.min(dp[i][j][p], dp[i][m][1] + dp[m+1][j][p-1]);
                        }
                    }
                }
                if (dp[i][j][k] != Integer.MAX_VALUE) {
                    dp[i][j][1] = dp[i][j][k] + (prefix[j+1] - prefix[i]);
                }
            }
        }
        
        return dp[0][n-1][1] == Integer.MAX_VALUE ? -1 : dp[0][n-1][1];
    }
}
