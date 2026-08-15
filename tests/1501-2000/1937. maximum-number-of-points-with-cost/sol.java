class Solution {
    public long maxPoints(int[][] points) {
        int m = points.length;
        int n = points[0].length;
        
        long[] dp = new long[n];
        for (int i = 0; i < n; i++) dp[i] = points[0][i];
        
        for (int r = 1; r < m; r++) {
            long[] left = new long[n];
            long[] right = new long[n];
            
            left[0] = dp[0];
            for (int c = 1; c < n; c++) {
                left[c] = Math.max(left[c-1], dp[c] + c);
            }
            
            right[n-1] = dp[n-1] - (n-1);
            for (int c = n-2; c >= 0; c--) {
                right[c] = Math.max(right[c+1], dp[c] - c);
            }
            
            long[] newDp = new long[n];
            for (int c = 0; c < n; c++) {
                long best = Math.max(left[c] - c, right[c] + c);
                newDp[c] = points[r][c] + best;
            }
            dp = newDp;
        }
        
        long max = Long.MIN_VALUE;
        for (long v : dp) max = Math.max(max, v);
        return max;
    }
}
