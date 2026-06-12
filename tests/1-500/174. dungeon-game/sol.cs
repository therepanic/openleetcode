public class Solution {
    public int CalculateMinimumHP(int[][] dungeon) {
        int rows = dungeon.Length, cols = dungeon[0].Length;
        int[][] dp = new int[rows][];
        for (int i = 0; i < rows; i++) dp[i] = new int[cols];
        dp[rows - 1][cols - 1] = Math.Max(1, 1 - dungeon[rows - 1][cols - 1]);
        for (int r = rows - 2; r >= 0; r--) dp[r][cols - 1] = Math.Max(1, dp[r + 1][cols - 1] - dungeon[r][cols - 1]);
        for (int c = cols - 2; c >= 0; c--) dp[rows - 1][c] = Math.Max(1, dp[rows - 1][c + 1] - dungeon[rows - 1][c]);
        for (int r = rows - 2; r >= 0; r--) for (int c = cols - 2; c >= 0; c--) dp[r][c] = Math.Max(1, Math.Min(dp[r + 1][c], dp[r][c + 1]) - dungeon[r][c]);
        return dp[0][0];
    }
}
