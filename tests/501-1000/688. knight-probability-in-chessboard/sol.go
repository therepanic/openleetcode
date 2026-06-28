func knightProbability(n int, k int, row int, column int) float64 {
    if k == 0 {
        return 1.0
    }
    
    moves := [][]int{{1, 2}, {2, 1}, {2, -1}, {1, -2}, {-1, -2}, {-2, -1}, {-2, 1}, {-1, 2}}
    
    dp := make([][]float64, n)
    for i := range dp {
        dp[i] = make([]float64, n)
    }
    dp[row][column] = 1.0
    
    for step := 0; step < k; step++ {
        nextDp := make([][]float64, n)
        for i := range nextDp {
            nextDp[i] = make([]float64, n)
        }
        for r := 0; r < n; r++ {
            for c := 0; c < n; c++ {
                if dp[r][c] == 0.0 {
                    continue
                }
                for _, move := range moves {
                    nr := r + move[0]
                    nc := c + move[1]
                    if nr >= 0 && nr < n && nc >= 0 && nc < n {
                        nextDp[nr][nc] += dp[r][c] / 8.0
                    }
                }
            }
        }
        dp = nextDp
    }
    
    total := 0.0
    for r := 0; r < n; r++ {
        for c := 0; c < n; c++ {
            total += dp[r][c]
        }
    }
    return total
}
