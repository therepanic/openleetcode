func getXORSum(arr1 []int, arr2 []int) int {
    x, y := 0, 0
    for _, v := range arr1 {
        x ^= v
    }
    for _, v := range arr2 {
        y ^= v
    }
    return x & y
}
