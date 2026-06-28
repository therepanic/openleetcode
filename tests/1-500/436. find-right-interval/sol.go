func findRightInterval(intervals [][]int) []int {
    n := len(intervals)
    starts := make([][2]int, n)
    for i, interval := range intervals {
        starts[i] = [2]int{interval[0], i}
    }
    sort.Slice(starts, func(i, j int) bool {
        return starts[i][0] < starts[j][0]
    })
    res := make([]int, n)
    for i, interval := range intervals {
        end := interval[1]
        left, right := 0, n-1
        idx := -1
        for left <= right {
            mid := (left + right) / 2
            if starts[mid][0] >= end {
                idx = starts[mid][1]
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        res[i] = idx
    }
    return res
}
