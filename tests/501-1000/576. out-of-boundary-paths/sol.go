func findPaths(m int, n int, maxMove int, startRow int, startColumn int) int {
    const MOD = 1000000007
    dp := make([][][]int, maxMove+1)
    for i := range dp {
        dp[i] = make([][]int, m)
        for j := range dp[i] {
            dp[i][j] = make([]int, n)
        }
    }
    directions := [][2]int{{-1, 0}, {1, 0}, {0, -1}, {0, 1}}

    for move := 1; move <= maxMove; move++ {
        for i := 0; i < m; i++ {
            for j := 0; j < n; j++ {
                for _, dir := range directions {
                    x, y := i+dir[0], j+dir[1]
                    if x < 0 || x >= m || y < 0 || y >= n {
                        dp[move][i][j] = (dp[move][i][j] + 1) % MOD
                    } else {
                        dp[move][i][j] = (dp[move][i][j] + dp[move-1][x][y]) % MOD
                    }
                }
            }
        }
    }

    return dp[maxMove][startRow][startColumn]
}
