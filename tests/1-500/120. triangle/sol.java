
class Solution {
    public int minimumTotal(int[][] triangle) {
        int[] dp = triangle[triangle.length - 1].clone();
        for (int row = triangle.length - 2; row >= 0; row--) {
            for (int col = 0; col <= row; col++) {
                dp[col] = triangle[row][col] + Math.min(dp[col], dp[col + 1]);
            }
        }
        return dp[0];
    }
}
