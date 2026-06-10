class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let rows = dungeon.count, cols = dungeon[0].count
        var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        dp[rows - 1][cols - 1] = max(1, 1 - dungeon[rows - 1][cols - 1])
        if rows >= 2 { for r in stride(from: rows - 2, through: 0, by: -1) { dp[r][cols - 1] = max(1, dp[r + 1][cols - 1] - dungeon[r][cols - 1]) } }
        if cols >= 2 { for c in stride(from: cols - 2, through: 0, by: -1) { dp[rows - 1][c] = max(1, dp[rows - 1][c + 1] - dungeon[rows - 1][c]) } }
        if rows >= 2 && cols >= 2 { for r in stride(from: rows - 2, through: 0, by: -1) { for c in stride(from: cols - 2, through: 0, by: -1) { dp[r][c] = max(1, min(dp[r + 1][c], dp[r][c + 1]) - dungeon[r][c]) } } }
        return dp[0][0]
    }
}
