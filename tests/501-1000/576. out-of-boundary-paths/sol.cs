public class Solution {
    public int FindPaths(int m, int n, int maxMove, int startRow, int startColumn) {
        const int MOD = 1000000007;
        int[][][] dp = new int[maxMove + 1][][];
        for (int i = 0; i <= maxMove; i++) {
            dp[i] = new int[m][];
            for (int j = 0; j < m; j++) {
                dp[i][j] = new int[n];
            }
        }
        int[][] directions = new int[][] { new int[] { -1, 0 }, new int[] { 1, 0 }, new int[] { 0, -1 }, new int[] { 0, 1 } };

        for (int move = 1; move <= maxMove; move++) {
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < n; j++) {
                    foreach (var dir in directions) {
                        int x = i + dir[0];
                        int y = j + dir[1];
                        if (x < 0 || x >= m || y < 0 || y >= n) {
                            dp[move][i][j] = (dp[move][i][j] + 1) % MOD;
                        } else {
                            dp[move][i][j] = (dp[move][i][j] + dp[move - 1][x][y]) % MOD;
                        }
                    }
                }
            }
        }

        return dp[maxMove][startRow][startColumn];
    }
}
