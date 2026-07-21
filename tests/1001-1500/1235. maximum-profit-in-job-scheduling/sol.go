func jobScheduling(startTime []int, endTime []int, profit []int) int {
    n := len(startTime)
    type Job struct {
        start, end, profit int
    }
    jobs := make([]Job, n)
    for i := 0; i < n; i++ {
        jobs[i] = Job{startTime[i], endTime[i], profit[i]}
    }
    sort.Slice(jobs, func(i, j int) bool {
        return jobs[i].start < jobs[j].start
    })
    
    starts := make([]int, n)
    for i := 0; i < n; i++ {
        starts[i] = jobs[i].start
    }
    
    dp := make([]int, n+1)
    for i := n - 1; i >= 0; i-- {
        idx := sort.SearchInts(starts[i+1:], jobs[i].end) + i + 1
        take := jobs[i].profit + dp[idx]
        notTake := dp[i+1]
        if take > notTake {
            dp[i] = take
        } else {
            dp[i] = notTake
        }
    }
    return dp[0]
}
