func cherryPickup(grid [][]int) int {
    m := len(grid)
    n := len(grid[0])
    dp := make([][][]int, m)
    for i := range dp {
        dp[i] = make([][]int, n)
        for j := range dp[i] {
            dp[i][j] = make([]int, n)
            for k := range dp[i][j] {
                dp[i][j][k] = -1
            }
        }
    }
    dp[0][0][n-1] = grid[0][0] + grid[0][n-1]

    for i := 1; i < m; i++ {
        for j := 0; j < n; j++ {
            for k := j+1; k < n; k++ {
                for x := -1; x <= 1; x++ {
                    for y := -1; y <= 1; y++ {
                        nj, nk := j+x, k+y
                        if nj >= 0 && nj < n && nk >= 0 && nk < n {
                            prev := dp[i-1][nj][nk]
                            if prev != -1 {
                                add := grid[i][j]
                                if j != k {
                                    add += grid[i][k]
                                }
                                if prev+add > dp[i][j][k] {
                                    dp[i][j][k] = prev + add
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    ans := -1
    for _, row := range dp[m-1] {
        for _, v := range row {
            if v > ans {
                ans = v
            }
        }
    }
    if ans != -1 {
        return ans
    }
    return 0
}
