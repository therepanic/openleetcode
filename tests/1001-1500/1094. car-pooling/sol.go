func carPooling(trips [][]int, capacity int) bool {
    diff := make([]int, 1001)
    for _, trip := range trips {
        num, start, end := trip[0], trip[1], trip[2]
        diff[start] += num
        diff[end] -= num
    }
    curr := 0
    for _, delta := range diff {
        curr += delta
        if curr > capacity {
            return false
        }
    }
    return true
}
