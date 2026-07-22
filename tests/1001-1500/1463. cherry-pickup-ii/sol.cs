public class Solution {
    public int CherryPickup(int[][] grid) {
        int m = grid.Length;
        int n = grid[0].Length;
        int[][][] dp = new int[m][][];
        for (int i = 0; i < m; i++) {
            dp[i] = new int[n][];
            for (int j = 0; j < n; j++) {
                dp[i][j] = new int[n];
                for (int k = 0; k < n; k++) {
                    dp[i][j][k] = -1;
                }
            }
        }
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
                                    dp[i][j][k] = Math.Max(dp[i][j][k], prev + add);
                                }
                            }
                        }
                    }
                }
            }
        }

        int ans = -1;
        for (int j = 0; j < n; j++) {
            for (int k = 0; k < n; k++) {
                if (dp[m-1][j][k] > ans) ans = dp[m-1][j][k];
            }
        }
        return ans != -1 ? ans : 0;
    }
}
