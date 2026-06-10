class Solution {
    public int calculateMinimumHP(int[][] dungeon) {
        int rows = dungeon.length, cols = dungeon[0].length;
        int[][] dp = new int[rows][cols];
        dp[rows - 1][cols - 1] = Math.max(1, 1 - dungeon[rows - 1][cols - 1]);
        for (int r = rows - 2; r >= 0; r--) dp[r][cols - 1] = Math.max(1, dp[r + 1][cols - 1] - dungeon[r][cols - 1]);
        for (int c = cols - 2; c >= 0; c--) dp[rows - 1][c] = Math.max(1, dp[rows - 1][c + 1] - dungeon[rows - 1][c]);
        for (int r = rows - 2; r >= 0; r--) for (int c = cols - 2; c >= 0; c--) dp[r][c] = Math.max(1, Math.min(dp[r + 1][c], dp[r][c + 1]) - dungeon[r][c]);
        return dp[0][0];
    }
}
