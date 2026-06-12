func calculateMinimumHP(dungeon [][]int) int {
    rows, cols := len(dungeon), len(dungeon[0])
    dp := make([][]int, rows)
    for i := range dp { dp[i] = make([]int, cols) }
    dp[rows-1][cols-1] = maxD(1, 1-dungeon[rows-1][cols-1])
    for r := rows - 2; r >= 0; r-- { dp[r][cols-1] = maxD(1, dp[r+1][cols-1]-dungeon[r][cols-1]) }
    for c := cols - 2; c >= 0; c-- { dp[rows-1][c] = maxD(1, dp[rows-1][c+1]-dungeon[rows-1][c]) }
    for r := rows - 2; r >= 0; r-- { for c := cols - 2; c >= 0; c-- { dp[r][c] = maxD(1, minD(dp[r+1][c], dp[r][c+1])-dungeon[r][c]) } }
    return dp[0][0]
}
func minD(a, b int) int { if a < b { return a }; return b }
func maxD(a, b int) int { if a > b { return a }; return b }
