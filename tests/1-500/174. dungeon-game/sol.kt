class Solution {
    fun calculateMinimumHP(dungeon: Array<IntArray>): Int {
        val rows = dungeon.size
        val cols = dungeon[0].size
        val dp = Array(rows) { IntArray(cols) }
        dp[rows - 1][cols - 1] = maxOf(1, 1 - dungeon[rows - 1][cols - 1])
        var r = rows - 2
        while (r >= 0) {
            dp[r][cols - 1] = maxOf(1, dp[r + 1][cols - 1] - dungeon[r][cols - 1])
            r--
        }
        var c = cols - 2
        while (c >= 0) {
            dp[rows - 1][c] = maxOf(1, dp[rows - 1][c + 1] - dungeon[rows - 1][c])
            c--
        }
        r = rows - 2
        while (r >= 0) {
            c = cols - 2
            while (c >= 0) {
                dp[r][c] = maxOf(1, minOf(dp[r + 1][c], dp[r][c + 1]) - dungeon[r][c])
                c--
            }
            r--
        }
        return dp[0][0]
    }
}
