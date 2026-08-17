func subsetXORSum(nums []int) int {
    total := 0
    for _, num := range nums {
        total |= num
    }
    return total * (1 << (len(nums) - 1))
}
