func colorTheGrid(m int, n int) int {
    mod := 1000000007
    total := 1
    for i := 0; i < m; i++ {
        total *= 3
    }
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, total)
    }
    rowValid := make([][]int, total)
    for i := range rowValid {
        rowValid[i] = make([]int, total)
    }
    good := []int{}
    pattern := make([][]int, total)
    for i := 0; i < total; i++ {
        pattern[i] = make([]int, m)
        val := i
        valid := 1
        for k := 0; k < m; k++ {
            pattern[i][k] = val % 3
            val /= 3
        }
        for k := 1; k < m; k++ {
            if pattern[i][k] == pattern[i][k-1] {
                valid = 0
            }
        }
        if valid == 1 {
            good = append(good, i)
        }
    }
    for _, i := range good {
        dp[1][i] = 1
    }
    for _, i := range good {
        for _, j := range good {
            rowValid[i][j] = 1
            for k := 0; k < m; k++ {
                if pattern[i][k] == pattern[j][k] {
                    rowValid[i][j] = 0
                }
            }
        }
    }
    for col := 2; col <= n; col++ {
        for _, i := range good {
            totalWays := 0
            for _, j := range good {
                if rowValid[i][j] == 1 {
                    totalWays += dp[col-1][j]
                }
            }
            dp[col][i] = totalWays % mod
        }
    }
    ans := 0
    for _, i := range good {
        ans += dp[n][i]
    }
    return ans % mod
}
