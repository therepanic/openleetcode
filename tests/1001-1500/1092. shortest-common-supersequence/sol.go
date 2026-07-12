func shortestCommonSupersequence(str1 string, str2 string) string {
    m, n := len(str1), len(str2)
    dp := make([][]int, m+1)
    for i := range dp {
        dp[i] = make([]int, n+1)
    }
    
    for i := 1; i <= m; i++ {
        for j := 1; j <= n; j++ {
            if str1[i-1] == str2[j-1] {
                dp[i][j] = 1 + dp[i-1][j-1]
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
    }
    
    i, j := m, n
    result := make([]byte, 0, m+n)
    
    for i > 0 && j > 0 {
        if str1[i-1] == str2[j-1] {
            result = append(result, str1[i-1])
            i--
            j--
        } else if dp[i-1][j] > dp[i][j-1] {
            result = append(result, str1[i-1])
            i--
        } else {
            result = append(result, str2[j-1])
            j--
        }
    }
    
    for i > 0 {
        result = append(result, str1[i-1])
        i--
    }
    
    for j > 0 {
        result = append(result, str2[j-1])
        j--
    }
    
    // Reverse
    for left, right := 0, len(result)-1; left < right; left, right = left+1, right-1 {
        result[left], result[right] = result[right], result[left]
    }
    
    return string(result)
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
