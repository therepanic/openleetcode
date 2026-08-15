func getLengthOfOptimalCompression(s string, k int) int {
    n := len(s)
    dp := make([][]int, 110)
    for i := range dp {
        dp[i] = make([]int, 110)
        for j := range dp[i] {
            dp[i][j] = 9999
        }
    }
    dp[0][0] = 0

    for i := 1; i <= n; i++ {
        for j := 0; j <= k; j++ {
            cnt, del := 0, 0
            for l := i; l >= 1; l-- {
                if s[l-1] == s[i-1] {
                    cnt++
                } else {
                    del++
                }
                if j-del >= 0 {
                    add := 0
                    if cnt >= 100 {
                        add = 3
                    } else if cnt >= 10 {
                        add = 2
                    } else if cnt >= 2 {
                        add = 1
                    }
                    if val := dp[l-1][j-del] + 1 + add; val < dp[i][j] {
                        dp[i][j] = val
                    }
                }
            }
            if j > 0 {
                if dp[i-1][j-1] < dp[i][j] {
                    dp[i][j] = dp[i-1][j-1]
                }
            }
        }
    }
    return dp[n][k]
}
