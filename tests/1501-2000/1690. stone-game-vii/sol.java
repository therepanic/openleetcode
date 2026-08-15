class Solution {
    public int stoneGameVII(int[] stones) {
        int n = stones.length;
        int[] prefix = new int[n + 1];
        
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + stones[i];
        }
        
        int[][] dp = new int[n][n];

        for (int length = 2; length <= n; length++) {
            for (int i = 0; i <= n - length; i++) {
                int j = i + length - 1;
                int total = prefix[j + 1] - prefix[i];
                dp[i][j] = Math.max(
                    total - stones[i] - dp[i + 1][j],
                    total - stones[j] - dp[i][j - 1]
                );
            }
        }

        return dp[0][n - 1];
    }
}
