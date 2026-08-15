func isCovered(ranges [][]int, left int, right int) bool {
    slots := make([]int, 51)
    for _, r := range ranges {
        s, e := r[0], r[1]
        for i := s; i <= e; i++ {
            slots[i] = 1
        }
    }
    for i := left; i <= right; i++ {
        if slots[i] == 0 {
            return false
        }
    }
    return true
}
