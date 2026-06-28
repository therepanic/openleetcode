func intersectionSizeTwo(intervals [][]int) int {
    sort.Slice(intervals, func(i, j int) bool {
        if intervals[i][1] != intervals[j][1] {
            return intervals[i][1] < intervals[j][1]
        }
        return intervals[i][0] > intervals[j][0]
    })
    ans := 0
    a, b := -1, -1
    for _, interval := range intervals {
        l, r := interval[0], interval[1]
        if l > b {
            a = r - 1
            b = r
            ans += 2
        } else if l > a {
            a = b
            b = r
            ans += 1
        }
    }
    return ans
}
