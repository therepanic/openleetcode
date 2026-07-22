class Solution {
    public int cherryPickup(int[][] grid) {
        int m = grid.length;
        int n = grid[0].length;
        int[][][] dp = new int[m][n][n];
        for (int i = 0; i < m; i++)
            for (int j = 0; j < n; j++)
                for (int k = 0; k < n; k++)
                    dp[i][j][k] = -1;
        dp[0][0][n-1] = grid[0][0] + grid[0][n-1];

        for (int i = 1; i < m; i++) {
            for (int j = 0; j < n; j++) {
                for (int k = j+1; k < n; k++) {
                    for (int x = -1; x <= 1; x++) {
                        for (int y = -1; y <= 1; y++) {
                            int nj = j + x;
                            int nk = k + y;
                            if (nj >= 0 && nj < n && nk >= 0 && nk < n) {
                                int prev = dp[i-1][nj][nk];
                                if (prev != -1) {
                                    int add = grid[i][j];
                                    if (j != k) add += grid[i][k];
                                    dp[i][j][k] = Math.max(dp[i][j][k], prev + add);
                                }
                            }
                        }
                    }
                }
            }
        }

        int ans = -1;
        for (int[] row : dp[m-1])
            for (int val : row)
                ans = Math.max(ans, val);
        return ans != -1 ? ans : 0;
    }
}
