func minimumEffort(tasks [][]int) int {
    sort.Slice(tasks, func(i, j int) bool {
        return (tasks[i][1]-tasks[i][0]) > (tasks[j][1]-tasks[j][0])
    })
    test := func(bal int) bool {
        for _, t := range tasks {
            if bal < t[1] {
                return false
            }
            bal -= t[0]
        }
        return true
    }
    lo, hi := 0, 1000000001
    for lo < hi {
        mid := (lo + hi) / 2
        if test(mid) {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    return lo
}
