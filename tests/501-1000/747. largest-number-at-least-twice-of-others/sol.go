func dominantIndex(nums []int) int {
    m := -1
    s := -1
    idx := -1
    for i, x := range nums {
        if x > m {
            s = m
            m = x
            idx = i
        } else if x > s {
            s = x
        }
    }
    if m >= s*2 {
        return idx
    }
    return -1
}
