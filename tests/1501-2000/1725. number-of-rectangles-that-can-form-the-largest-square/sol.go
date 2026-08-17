func countGoodRectangles(rectangles [][]int) int {
    maxLen := 0
    for _, rec := range rectangles {
        mn := rec[0]
        if rec[1] < mn {
            mn = rec[1]
        }
        if mn > maxLen {
            maxLen = mn
        }
    }
    count := 0
    for _, rec := range rectangles {
        mn := rec[0]
        if rec[1] < mn {
            mn = rec[1]
        }
        if mn == maxLen {
            count++
        }
    }
    return count
}
