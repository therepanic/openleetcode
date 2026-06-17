class Solution {
    public int maxCoins(int[] nums) {
        int m = nums.length;
        int[] balloons = new int[m + 2];
        balloons[0] = 1;
        balloons[m + 1] = 1;
        for (int i = 0; i < m; i++) {
            balloons[i + 1] = nums[i];
        }
        int n = balloons.length;
        int[][] dp = new int[n][n];
        
        for (int length = 2; length < n; length++) {
            for (int left = 0; left < n - length; left++) {
                int right = left + length;
                int best = 0;
                for (int k = left + 1; k < right; k++) {
                    int gain = balloons[left] * balloons[k] * balloons[right];
                    int total = gain + dp[left][k] + dp[k][right];
                    if (total > best) {
                        best = total;
                    }
                }
                dp[left][right] = best;
            }
        }
        
        return dp[0][n-1];
    }
}
