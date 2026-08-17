func maxPoints(points [][]int) int64 {
    m := len(points)
    n := len(points[0])
    
    dp := make([]int64, n)
    for i := 0; i < n; i++ {
        dp[i] = int64(points[0][i])
    }
    
    for r := 1; r < m; r++ {
        left := make([]int64, n)
        right := make([]int64, n)
        
        left[0] = dp[0]
        for c := 1; c < n; c++ {
            left[c] = maxInt64(left[c-1], dp[c] + int64(c))
        }
        
        right[n-1] = dp[n-1] - int64(n-1)
        for c := n-2; c >= 0; c-- {
            right[c] = maxInt64(right[c+1], dp[c] - int64(c))
        }
        
        newDp := make([]int64, n)
        for c := 0; c < n; c++ {
            best := maxInt64(left[c] - int64(c), right[c] + int64(c))
            newDp[c] = int64(points[r][c]) + best
        }
        dp = newDp
    }
    
    maxVal := dp[0]
    for _, v := range dp {
        if v > maxVal {
            maxVal = v
        }
    }
    return maxVal
}

func maxInt64(a, b int64) int64 {
    if a > b {
        return a
    }
    return b
}
