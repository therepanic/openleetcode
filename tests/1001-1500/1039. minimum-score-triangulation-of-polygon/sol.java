class Solution {
    public int minScoreTriangulation(int[] values) {
        int n = values.length;
        int[][] dp = new int[n][n];
        for (int i = n - 1; i >= 0; i--) {
            for (int j = i + 1; j < n; j++) {
                int minVal = Integer.MAX_VALUE;
                for (int k = i + 1; k < j; k++) {
                    int val = dp[i][k] + values[i] * values[k] * values[j] + dp[k][j];
                    if (val < minVal) {
                        minVal = val;
                    }
                }
                if (minVal != Integer.MAX_VALUE) {
                    dp[i][j] = minVal;
                }
            }
        }
        return dp[0][n - 1];
    }
}
