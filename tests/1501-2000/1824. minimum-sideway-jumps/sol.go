func minSideJumps(obstacles []int) int {
    INF := int(^uint(0) >> 1) / 2
    dp := []int{1, 0, 1}
    for i := 1; i < len(obstacles); i++ {
        obs := obstacles[i]
        for j := 0; j < 3; j++ {
            if obs == j+1 {
                dp[j] = INF
            }
        }
        for j := 0; j < 3; j++ {
            if obs != j+1 {
                minVal := dp[(j+1)%3]
                if dp[(j+2)%3] < minVal {
                    minVal = dp[(j+2)%3]
                }
                if dp[j] > minVal+1 {
                    dp[j] = minVal + 1
                }
            }
        }
    }
    result := dp[0]
    for _, v := range dp {
        if v < result {
            result = v
        }
    }
    return result
}
