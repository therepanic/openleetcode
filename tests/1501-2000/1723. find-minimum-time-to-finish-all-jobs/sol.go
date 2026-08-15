func minimumTimeRequired(jobs []int, k int) int {
    sort.Sort(sort.Reverse(sort.IntSlice(jobs)))
    left, right := jobs[0], 0
    for _, j := range jobs {
        right += j
    }
    
    canDistribute := func(maxWorkload int) bool {
        workers := make([]int, k)
        
        var assignJob func(int) bool
        assignJob = func(jobIndex int) bool {
            if jobIndex == len(jobs) {
                return true
            }
            for i := 0; i < k; i++ {
                if workers[i] + jobs[jobIndex] <= maxWorkload {
                    workers[i] += jobs[jobIndex]
                    if assignJob(jobIndex + 1) {
                        return true
                    }
                    workers[i] -= jobs[jobIndex]
                }
                if workers[i] == 0 {
                    break
                }
            }
            return false
        }
        
        return assignJob(0)
    }
    
    for left < right {
        mid := (left + right) / 2
        if canDistribute(mid) {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return left
}
