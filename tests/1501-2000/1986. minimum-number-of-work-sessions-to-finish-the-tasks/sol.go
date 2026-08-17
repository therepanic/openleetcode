func minSessions(tasks []int, sessionTime int) int {
    sort.Sort(sort.Reverse(sort.IntSlice(tasks)))
    
    feasibility := func(n int) bool {
        sessions := make([]int, n)
        
        var dfs func(i int) bool
        dfs = func(i int) bool {
            for _, v := range sessions {
                if v > sessionTime {
                    return false
                }
            }
            if i == len(tasks) {
                return true
            }
            
            for s := 0; s < n; s++ {
                sessions[s] += tasks[i]
                if dfs(i+1) {
                    return true
                }
                sessions[s] -= tasks[i]
                if sessions[s] == 0 {
                    return false
                }
            }
            return false
        }
        
        return dfs(0)
    }
    
    lo, hi := 1, len(tasks)
    res := hi
    for lo <= hi {
        mid := (lo + hi) / 2
        if feasibility(mid) {
            res = mid
            hi = mid - 1
        } else {
            lo = mid + 1
        }
    }
    return res
}
