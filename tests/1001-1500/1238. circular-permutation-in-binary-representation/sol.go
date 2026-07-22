func circularPermutation(n int, start int) []int {
    size := 1 << n
    result := make([]int, size)
    for i := 0; i < size; i++ {
        result[i] = start ^ (i ^ (i >> 1))
    }
    return result
}
