public class Solution {
    public int UniquePaths(int m, int n) {
        int[] dp = new int[n];
        for (int col = 0; col < n; col++) {
            dp[col] = 1;
        }
        for (int row = 1; row < m; row++) {
            for (int col = 1; col < n; col++) {
                dp[col] += dp[col - 1];
            }
        }
        return dp[n - 1];
    }
}
