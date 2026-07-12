func mincostTickets(days []int, costs []int) int {
    n := len(days)
    left7 := 0
    left30 := 0
    dp := make([]int, n)
    
    for right := 0; right < n; right++ {
        for days[right] - days[left7] >= 7 {
            left7++
        }
        for days[right] - days[left30] >= 30 {
            left30++
        }
        
        cost1 := costs[0]
        if right > 0 {
            cost1 += dp[right - 1]
        }
        cost7 := costs[1]
        if left7 > 0 {
            cost7 += dp[left7 - 1]
        }
        cost30 := costs[2]
        if left30 > 0 {
            cost30 += dp[left30 - 1]
        }
        
        dp[right] = min(cost1, min(cost7, cost30))
    }
    
    return dp[n - 1]
}
