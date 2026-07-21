func ways(pizza []string, k int) int {
    m, n := len(pizza), len(pizza[0])
    MOD := 1_000_000_007
    preSum := make([][]int, m+1)
    for i := range preSum {
        preSum[i] = make([]int, n+1)
    }

    for r := m - 1; r >= 0; r-- {
        for c := n - 1; c >= 0; c-- {
            val := 0
            if pizza[r][c] == 'A' {
                val = 1
            }
            preSum[r][c] = preSum[r][c+1] + preSum[r+1][c] - preSum[r+1][c+1] + val
        }
    }

    dp := make([][][]int, k)
    for i := 0; i < k; i++ {
        dp[i] = make([][]int, m)
        for j := 0; j < m; j++ {
            dp[i][j] = make([]int, n)
        }
    }

    for r := 0; r < m; r++ {
        for c := 0; c < n; c++ {
            if preSum[r][c] > 0 {
                dp[0][r][c] = 1
            }
        }
    }

    for cuts := 1; cuts < k; cuts++ {
        for r := 0; r < m; r++ {
            for c := 0; c < n; c++ {
                if preSum[r][c] == 0 {
                    continue
                }
                ans := 0
                for nr := r + 1; nr < m; nr++ {
                    if preSum[r][c]-preSum[nr][c] > 0 {
                        ans = (ans + dp[cuts-1][nr][c]) % MOD
                    }
                }
                for nc := c + 1; nc < n; nc++ {
                    if preSum[r][c]-preSum[r][nc] > 0 {
                        ans = (ans + dp[cuts-1][r][nc]) % MOD
                    }
                }
                dp[cuts][r][c] = ans
            }
        }
    }

    return dp[k-1][0][0]
}
