class Solution {
    public int orderOfLargestPlusSign(int n, int[][] mines) {
        Set<Integer> s = new HashSet<>();
        for (int[] mine : mines) {
            s.add(mine[0] * n + mine[1]);
        }
        int[][] dp = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                dp[i][j] = n;
            }
        }
        
        for (int i = 0; i < n; i++) {
            int count = 0;
            for (int j = 0; j < n; j++) {
                count = s.contains(i * n + j) ? 0 : count + 1;
                dp[i][j] = Math.min(dp[i][j], count);
            }
            count = 0;
            for (int j = n - 1; j >= 0; j--) {
                count = s.contains(i * n + j) ? 0 : count + 1;
                dp[i][j] = Math.min(dp[i][j], count);
            }
        }
        
        for (int j = 0; j < n; j++) {
            int count = 0;
            for (int i = 0; i < n; i++) {
                count = s.contains(i * n + j) ? 0 : count + 1;
                dp[i][j] = Math.min(dp[i][j], count);
            }
            count = 0;
            for (int i = n - 1; i >= 0; i--) {
                count = s.contains(i * n + j) ? 0 : count + 1;
                dp[i][j] = Math.min(dp[i][j], count);
            }
        }
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                ans = Math.max(ans, dp[i][j]);
            }
        }
        return ans;
    }
}
