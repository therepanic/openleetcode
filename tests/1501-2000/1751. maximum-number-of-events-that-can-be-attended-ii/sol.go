func maxValue(events [][]int, k int) int {
    sort.Slice(events, func(i, j int) bool {
        return events[i][1] < events[j][1]
    })
    n := len(events)
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, k+1)
    }
    
    for i := 1; i <= n; i++ {
        start := events[i-1][0]
        value := events[i-1][2]
        prev := findLastNonOverlapping(events, i-1, start)
        for j := 1; j <= k; j++ {
            take := dp[prev+1][j-1] + value
            if dp[i-1][j] > take {
                dp[i][j] = dp[i-1][j]
            } else {
                dp[i][j] = take
            }
        }
    }
    return dp[n][k]
}

func findLastNonOverlapping(events [][]int, right int, targetStart int) int {
    left := 0
    res := -1
    for left <= right {
        mid := (left + right) / 2
        if events[mid][1] < targetStart {
            res = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return res
}
