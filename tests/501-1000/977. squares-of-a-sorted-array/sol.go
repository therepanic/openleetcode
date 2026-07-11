func sortedSquares(nums []int) []int {
    newarr := make([]int, len(nums))
    for i, v := range nums {
        newarr[i] = v * v
    }
    sort.Ints(newarr)
    return newarr
}
