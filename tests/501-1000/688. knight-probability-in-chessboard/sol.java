class Solution {
    public double knightProbability(int n, int k, int row, int column) {
        if (k == 0) return 1.0;
        
        int[][] moves = {{1, 2}, {2, 1}, {2, -1}, {1, -2}, {-1, -2}, {-2, -1}, {-2, 1}, {-1, 2}};
        
        double[][] dp = new double[n][n];
        dp[row][column] = 1.0;
        
        for (int step = 0; step < k; step++) {
            double[][] nextDp = new double[n][n];
            for (int r = 0; r < n; r++) {
                for (int c = 0; c < n; c++) {
                    if (dp[r][c] == 0.0) continue;
                    for (int[] move : moves) {
                        int nr = r + move[0];
                        int nc = c + move[1];
                        if (nr >= 0 && nr < n && nc >= 0 && nc < n) {
                            nextDp[nr][nc] += dp[r][c] / 8.0;
                        }
                    }
                }
            }
            dp = nextDp;
        }
        
        double total = 0.0;
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < n; c++) {
                total += dp[r][c];
            }
        }
        return total;
    }
}
