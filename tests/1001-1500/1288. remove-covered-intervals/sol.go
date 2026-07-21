func removeCoveredIntervals(intervals [][]int) int {
    sort.Slice(intervals, func(i, j int) bool {
        if intervals[i][0] == intervals[j][0] {
            return intervals[i][1] > intervals[j][1]
        }
        return intervals[i][0] < intervals[j][0]
    })
    res, r := 0, 0
    for _, interval := range intervals {
        if interval[1] > r {
            res++
        }
        if interval[1] > r {
            r = interval[1]
        }
    }
    return res
}
