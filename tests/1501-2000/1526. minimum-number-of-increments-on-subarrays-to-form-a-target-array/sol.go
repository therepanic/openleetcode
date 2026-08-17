func minNumberOperations(target []int) int {
    total := target[0]
    for i := 1; i < len(target); i++ {
        if target[i] > target[i-1] {
            total += target[i] - target[i-1]
        }
    }
    return total
}
