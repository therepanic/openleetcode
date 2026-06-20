func hIndex(citations []int) int {
    n := len(citations)
    l, r := 0, n
    for l < r {
        m := (l + r + 1) / 2
        if citations[n - m] >= m {
            l = m
        } else {
            r = m - 1
        }
    }
    return l
}
