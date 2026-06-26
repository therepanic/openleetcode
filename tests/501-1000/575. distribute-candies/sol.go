func distributeCandies(candyType []int) int {
    n := len(candyType)
    k := n / 2
    set := make(map[int]bool)
    for _, candy := range candyType {
        set[candy] = true
    }
    if k < len(set) {
        return k
    }
    return len(set)
}
