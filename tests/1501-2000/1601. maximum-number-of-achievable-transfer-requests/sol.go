func maximumRequests(n int, requests [][]int) int {
    ans := 0
    indegree := make([]int, n)
    var helper func(start int, count int)
    helper = func(start int, count int) {
        if start == len(requests) {
            ok := true
            for _, v := range indegree {
                if v != 0 {
                    ok = false
                    break
                }
            }
            if ok && count > ans {
                ans = count
            }
            return
        }
        
        // Take
        indegree[requests[start][0]]--
        indegree[requests[start][1]]++
        helper(start+1, count+1)
        
        // Not-take
        indegree[requests[start][0]]++
        indegree[requests[start][1]]--
        helper(start+1, count)
    }
    helper(0, 0)
    return ans
}
