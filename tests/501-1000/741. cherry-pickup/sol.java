class Solution {
    public int cherryPickup(int[][] grid) {
        int n = grid.length;
        
        int[][] dp = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                dp[i][j] = Integer.MIN_VALUE;
            }
        }
        dp[0][0] = 0;
        
        for (int k = 0; k <= 2 * (n - 1); k++) {
            int[][] newDp = new int[n][n];
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    newDp[i][j] = Integer.MIN_VALUE;
                }
            }
            
            for (int x1 = 0; x1 < n; x1++) {
                int y1 = k - x1;
                if (!(y1 >= 0 && y1 < n)) continue;
                
                for (int x2 = 0; x2 < n; x2++) {
                    int y2 = k - x2;
                    if (!(y2 >= 0 && y2 < n)) continue;
                    
                    if (grid[x1][y1] == -1 || grid[x2][y2] == -1) continue;
                    
                    int best = dp[x1][x2];
                    if (x1 > 0) best = Math.max(best, dp[x1-1][x2]);
                    if (x2 > 0) best = Math.max(best, dp[x1][x2-1]);
                    if (x1 > 0 && x2 > 0) best = Math.max(best, dp[x1-1][x2-1]);
                    
                    if (best == Integer.MIN_VALUE) continue;
                    
                    best += grid[x1][y1];
                    if (x1 != x2) best += grid[x2][y2];
                    
                    newDp[x1][x2] = best;
                }
            }
            
            dp = newDp;
        }
        
        return Math.max(0, dp[n-1][n-1]);
    }
}
