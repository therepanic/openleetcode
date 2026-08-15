func addRungs(rungs []int, dist int) int {
    curr := 0
    res := 0
    for _, rung := range rungs {
        if rung - curr > dist {
            res += (rung - curr - 1) / dist
        }
        curr = rung
    }
    return res
}
