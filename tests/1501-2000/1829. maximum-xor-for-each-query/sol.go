func getMaximumXor(nums []int, maximumBit int) []int {
    n := len(nums)
    ans := make([]int, n)
    mask := (1 << maximumBit) - 1
    curr := 0
    for i, num := range nums {
        curr ^= num
        ans[n - 1 - i] = mask ^ curr
    }
    return ans
}
