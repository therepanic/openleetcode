public class Solution {
    public int MaxProductPath(int[][] grid) {
        int r = grid.Length, c = grid[0].Length;
        long MOD = 1_000_000_007L;
        long[][][] dp = new long[r][][];
        for (int i = 0; i < r; i++) {
            dp[i] = new long[c][];
            for (int j = 0; j < c; j++) {
                dp[i][j] = new long[2];
            }
        }
        
        long p = grid[0][0];
        dp[0][0][0] = dp[0][0][1] = p;
        for (int j = 1; j < c; j++) {
            p *= grid[0][j];
            dp[0][j][0] = dp[0][j][1] = p;
        }
        
        p = grid[0][0];
        for (int i = 1; i < r; i++) {
            p *= grid[i][0];
            dp[i][0][0] = dp[i][0][1] = p;
            for (int j = 1; j < c; j++) {
                long x = grid[i][j];
                long[] vals = {x * dp[i][j-1][0], x * dp[i][j-1][1], x * dp[i-1][j][0], x * dp[i-1][j][1]};
                long mn = vals[0], mx = vals[0];
                for (int k = 1; k < 4; k++) {
                    mn = Math.Min(mn, vals[k]);
                    mx = Math.Max(mx, vals[k]);
                }
                dp[i][j][0] = mn;
                dp[i][j][1] = mx;
            }
        }
        
        long ans = dp[r-1][c-1][1];
        if (ans < 0) return -1;
        return (int)(ans % MOD);
    }
}
