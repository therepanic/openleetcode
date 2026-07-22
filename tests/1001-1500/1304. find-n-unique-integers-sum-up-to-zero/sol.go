func sumZero(n int) []int {
    result := make([]int, n)
    for i := 0; i < n; i++ {
        result[i] = i * 2 - n + 1
    }
    return result
}
