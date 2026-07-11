func minDeletionSize(strs []string) int {
    m := len(strs[0])
    dp := make([]int, m)
    for i := range dp {
        dp[i] = 1
    }
    
    for i := 0; i < m; i++ {
        for j := 0; j < i; j++ {
            all := true
            for _, row := range strs {
                if row[j] > row[i] {
                    all = false
                    break
                }
            }
            if all && dp[j]+1 > dp[i] {
                dp[i] = dp[j] + 1
            }
        }
    }
    
    maxDp := 0
    for _, val := range dp {
        if val > maxDp {
            maxDp = val
        }
    }
    return m - maxDp
}
