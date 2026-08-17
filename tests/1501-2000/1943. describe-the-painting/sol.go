func splitPainting(segments [][]int) [][]int64 {
    events := make([][2]int, 0, len(segments)*2)
    for _, seg := range segments {
        events = append(events, [2]int{seg[0], seg[2]})
        events = append(events, [2]int{seg[1], -seg[2]})
    }
    sort.Slice(events, func(i, j int) bool {
        return events[i][0] < events[j][0]
    })
    
    ans := make([][]int64, 0)
    prev := -1
    var mix int64 = 0
    for _, e := range events {
        if prev != -1 {
            if e[0] != prev && mix != 0 {
                ans = append(ans, []int64{int64(prev), int64(e[0]), mix})
            }
        }
        prev = e[0]
        mix += int64(e[1])
    }
    return ans
}
