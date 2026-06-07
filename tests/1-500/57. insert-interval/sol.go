func insert(intervals [][]int, newInterval []int) [][]int {
    res := make([][]int, 0, len(intervals)+1)
    i := 0

    for i < len(intervals) && intervals[i][1] < newInterval[0] {
        res = append(res, intervals[i])
        i++
    }

    start, end := newInterval[0], newInterval[1]
    for i < len(intervals) && intervals[i][0] <= end {
        if intervals[i][0] < start {
            start = intervals[i][0]
        }
        if intervals[i][1] > end {
            end = intervals[i][1]
        }
        i++
    }
    res = append(res, []int{start, end})

    for i < len(intervals) {
        res = append(res, intervals[i])
        i++
    }

    return res
}
