func maximumScore(nums []int, multipliers []int) int {
    m := len(multipliers)
    dp := make([][]*int, m+1)
    for i := range dp {
        dp[i] = make([]*int, m+1)
    }
    
    var f func(i, j int) int
    f = func(i, j int) int {
        k := i + j
        if k == m {
            return 0
        }
        if dp[i][j] != nil {
            return *dp[i][j]
        }
        back := multipliers[k] * nums[len(nums)-1-j] + f(i, j+1)
        front := multipliers[k] * nums[i] + f(i+1, j)
        result := max(front, back)
        dp[i][j] = &result
        return result
    }
    
    return f(0, 0)
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
