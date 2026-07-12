func largeGroupPositions(s string) [][]int {
    intervals := make([][]int, 0)
    left := 0
    for left < len(s) {
        start := left
        for left + 1 < len(s) && s[left + 1] == s[left] {
            left++
        }
        if left - start >= 2 {
            intervals = append(intervals, []int{start, left})
        }
        left++
    }
    return intervals
}
