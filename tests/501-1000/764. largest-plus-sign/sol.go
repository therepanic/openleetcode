func orderOfLargestPlusSign(n int, mines [][]int) int {
    s := make(map[int]bool)
    for _, mine := range mines {
        s[mine[0]*n+mine[1]] = true
    }
    dp := make([][]int, n)
    for i := 0; i < n; i++ {
        dp[i] = make([]int, n)
        for j := 0; j < n; j++ {
            dp[i][j] = n
        }
    }
    
    for i := 0; i < n; i++ {
        count := 0
        for j := 0; j < n; j++ {
            if s[i*n+j] {
                count = 0
            } else {
                count++
            }
            if count < dp[i][j] {
                dp[i][j] = count
            }
        }
        count = 0
        for j := n - 1; j >= 0; j-- {
            if s[i*n+j] {
                count = 0
            } else {
                count++
            }
            if count < dp[i][j] {
                dp[i][j] = count
            }
        }
    }
    
    for j := 0; j < n; j++ {
        count := 0
        for i := 0; i < n; i++ {
            if s[i*n+j] {
                count = 0
            } else {
                count++
            }
            if count < dp[i][j] {
                dp[i][j] = count
            }
        }
        count = 0
        for i := n - 1; i >= 0; i-- {
            if s[i*n+j] {
                count = 0
            } else {
                count++
            }
            if count < dp[i][j] {
                dp[i][j] = count
            }
        }
    }
    
    ans := 0
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            if dp[i][j] > ans {
                ans = dp[i][j]
            }
        }
    }
    return ans
}
