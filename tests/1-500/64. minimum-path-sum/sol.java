public class Solution {
    public int minPathSum(int[][] grid) {
        int rows = grid.length;
        int cols = grid[0].length;
        int[] dp = new int[cols];
        dp[0] = grid[0][0];

        for (int col = 1; col < cols; col++) {
            dp[col] = dp[col - 1] + grid[0][col];
        }

        for (int row = 1; row < rows; row++) {
            dp[0] += grid[row][0];
            for (int col = 1; col < cols; col++) {
                dp[col] = Math.min(dp[col], dp[col - 1]) + grid[row][col];
            }
        }

        return dp[cols - 1];
    }
}
