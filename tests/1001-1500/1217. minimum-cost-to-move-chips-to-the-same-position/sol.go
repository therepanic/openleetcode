func minCostToMoveChips(position []int) int {
    even, odd := 0, 0
    for _, i := range position {
        if i % 2 == 0 {
            even++
        } else {
            odd++
        }
    }
    if even < odd {
        return even
    }
    return odd
}
