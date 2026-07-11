class Solution {
    public int minFallingPathSum(int[][] matrix) {
        int m = matrix.length;
        int n = matrix[0].length;
        int[] dp = matrix[0].clone();
        for (int i = 1; i < m; i++) {
            int[] ndp = new int[n];
            for (int j = 0; j < n; j++) {
                int best = dp[j];
                if (j > 0) best = Math.min(best, dp[j - 1]);
                if (j + 1 < n) best = Math.min(best, dp[j + 1]);
                ndp[j] = matrix[i][j] + best;
            }
            dp = ndp;
        }
        int ans = dp[0];
        for (int v : dp) {
            if (v < ans) ans = v;
        }
        return ans;
    }
}
