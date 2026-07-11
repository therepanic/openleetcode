func maxProfitAssignment(difficulty []int, profit []int, worker []int) int {
    n := len(difficulty)
    jobs := make([][2]int, n)
    for i := 0; i < n; i++ {
        jobs[i] = [2]int{difficulty[i], profit[i]}
    }
    sort.Slice(jobs, func(i, j int) bool {
        return jobs[i][0] < jobs[j][0]
    })
    sort.Ints(worker)
    ans := 0
    best := 0
    idx := 0
    for _, ability := range worker {
        for idx < n && jobs[idx][0] <= ability {
            if jobs[idx][1] > best {
                best = jobs[idx][1]
            }
            idx++
        }
        ans += best
    }
    return ans
}
